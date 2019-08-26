// var

var localStream
var remoteStream
var pc;

var pcArr = []

var pcConfig = {
    'iceServers': [
        {
            'urls': 'stun:stun.l.google.com:19302'
        }
        ,
        {
            urls: 'turn:numb.viagenie.ca',
            credential: 'muazkh',
            username: 'webrtc@live.com'
        }
    ]
};

var sdpConstraints = {
    offerToReceiveAudio: true,
    offerToReceiveVideo: true
};

// socket

var room = 'foo'
// var name = $('#userInfo').attr("name")
var name = 'test'
var class_num = 1;


var socket = io.connect("https://localhost:3000");

if (room !== "") {
    socket.emit('create or join', name, room, class_num)
    console.log('create or join 메세지 서버에 전송', room);
}


socket.on('created', function (room) {
    console.log(`방 생성 ${room}`);
    startCast()
})

socket.on('join', function (numClients, id) {
    console.log('쪼인!!!');
    casterPeerCreate(id)
})

// socket.on('entrance', function () {

// })

// socket Event

socket.on('message', function (msg, id) {
    if (msg.type === 'offer') {
        console.log(`받은 메세지 offer`);
        userPeerCreate()
        pc.setRemoteDescription(new RTCSessionDescription(msg));
        sendAnswer()
    } else if (msg.type === 'answer') {
        console.log(`받은 메세지 answer`);
        commitPc(findPc(id).setRemoteDescription(new RTCSessionDescription(msg)), id);
        // pc.setRemoteDescription(new RTCSessionDescription(msg));
    } else if (msg.type === 'candidate') {
        var candidate = new RTCIceCandidate({
            sdpMLineIndex: msg.label,
            candidate: msg
        });

        var empPc = findPc(id)

        if (empPc) {
            commitPc(empPc.addIceCandidate(candidate), id)
        } else {
            pc.addIceCandidate(candidate)
        }
        // commitPc(findPc(id).addIceCandidate(candidate), id);
        // pc.addIceCandidate(candidate);
    } else if (msg === 'bye') {
        handleRemoteHangup(id)
    }
})

socket.on('chatMsg', function (data) {
    if (data.type === 'msg') {
        appendMsg('other', data.chatMessage, data.name)
    } else if (data.type === 'leaveCaster') {
        appendMsg('server', 'Caster leave this Room')
    }
});

socket.on('joinedRoom', function (data) {
    appendMsg('server', `${data.name}님이 ${data.room}에 입장하셨습니다.`)
})

socket.on('leaveUser', function (data) {
    appendMsg('server', `${data.name}님께서 접속을 종료하셨습니다.`)
})

// what?

var constraints = {
    video: true
};

console.log('Getting user media with constraints', constraints);

if (location.hostname !== 'localhost') {
    requestTurn(
        'https://computeengineondemand.appspot.com/turn?username=41784574&key=4080218913'
    );
}

window.onbeforeunload = function () {
    sendMessage('bye');
};

// funtions

function findPc(id) {
    for (let i = 0; i < pcArr.length; i++) {
        if (pcArr[i].id === id) {
            return pcArr[i].pc
        }
    }
}

function commitPc(pc, id) {
    for (let i = 0; i < pcArr.length; i++) {
        if (pcArr[i].id === id) {
            pcArr[i].pc === pc
        }
    }
}

function sendMessage(msg) {
    socket.emit('message', msg, room)
}

function userSendMessage(msg) {
    console.log(`클라이언트가 메세지 보냄 ${msg}`);
    socket.emit('userMsg', msg, room)
}

function casterSendMessage(msg, id) {
    socket.emit('casterMsg', msg, id)
}

var localVideo = document.querySelector('#localVideo')
var remoteVideo = document.querySelector('#remoteVideo')

function startCast() {
    navigator.mediaDevices.getUserMedia({
        audio: true,
        video: { width: { ideal: 1280 }, height: { ideal: 720 } }
    })
        .then(gotStream)
        .catch(function (e) {
            alert(`getUserMedia 에러!! ${e.name}`)
        })
}

function gotStream(stream) {
    console.log('로컬 스트림 추가');
    localStream = stream
    localVideo.srcObject = stream
}

function casterPeerCreate(id) {
    console.log('피어 커넥션 생성');

    pcArr.push({ 'id': id, pc: createPeerConnectionCaster(id) })
    //createPeerConnection()

    commitPc(findPc(id).addStream(localStream), id)
    // pc.addStream(localStream)

    sendOffer(id)
}

function joinUser() {
    console.log('joinUser');
    createPeerConnectionUser()
    // sendMessage('requestOffer')
}

function sendOffer(id) {
    console.log('오퍼 보냄');
    // pc.createOffer(setLocalAndSendMessage, handleCreateOfferError)
    findPc(id).createOffer()
        .then(function (sessionDescription) {
            setLocalAndSendMessageCaster(sessionDescription, id)
        })
        .catch(function (err) {
            handleCreateOfferError(err)
        })
}

function handleCreateOfferError(event) {
    console.log('createOffer() error: ', event);
}

function sendAnswer() {
    console.log('Sending answer to peer.');
    pc.createAnswer().then(
        setLocalAndSendMessageUser,
        onCreateSessionDescriptionError
    );
}

function setLocalAndSendMessageUser(sessionDescription) {
    pc.setLocalDescription(sessionDescription);
    console.log('setLocalAndSendMessage sending message', sessionDescription);
    // sendMessage(sessionDescription);
    userSendMessage(sessionDescription);
}

function setLocalAndSendMessageCaster(sessionDescription, id) {
    commitPc(findPc(id).setLocalDescription(sessionDescription), id);
    // pc.setLocalDescription(sessionDescription);
    console.log('setLocalAndSendMessage sending message', sessionDescription);
    // sendMessage(sessionDescription);
    casterSendMessage(sessionDescription, id);
}

function onCreateSessionDescriptionError(error) {
    trace('Failed to create session description: ' + error.toString());
}

// createPeectConnection

function createPeerConnectionUser() {
    try {
        pc = new RTCPeerConnection(null);
        pc.onicecandidate = handleIceCandidateUser
        pc.onaddstream = handleRemoteStreamAdded
        pc.onremovestream = handleRemoteStreamRemoved
        console.log('피어 커넥션 (View) 생성 완료');

    } catch (e) {
        console.log('피어 커넥션 (View) 생성 오류', e.message);
        alert('Cannot create RTCPeerConnection object.');
        return;
    }
}

function createPeerConnectionCaster(id) {
    var empPc
    try {
        empPc = new RTCPeerConnection(null);
        // empPc.onicecandidate = handleIceCandidateLec
        empPc.onicecandidate = function (event) {
            handleIceCandidateCaster(event, id)
        }
        empPc.onaddstream = handleRemoteStreamAdded
        empPc.onremovestream = handleRemoteStreamRemoved
        console.log('피어 커넥션 (Lec) 생성 완료');
        return empPc
    } catch (e) {
        console.log('피어 커넥션 (Lec) 생성 오류', e.message);
        alert('Cannot create RTCPeerConnection object.');
        return;
    }
}

function handleIceCandidateUser(event) {
    console.log('icecandidate event: ', event);
    if (event.candidate) {
        userSendMessage({
            type: 'candidate',
            label: event.candidate.sdpMLineIndex,
            id: event.candidate.sdpMid,
            candidate: event.candidate.candidate
        });
    } else {
        console.log('End of candidates.');
    }
}

function handleIceCandidateCaster(event, id) {
    console.log('icecandidate event: ', event);
    if (event.candidate) {
        casterSendMessage({
            type: 'candidate',
            label: event.candidate.sdpMLineIndex,
            id: event.candidate.sdpMid,
            candidate: event.candidate.candidate
        }, id);
    } else {
        console.log('End of candidates.');
    }
}

function handleRemoteStreamAdded(event) {
    console.log('Remote stream added.');
    remoteStream = event.stream;
    remoteVideo.srcObject = remoteStream;
}

function handleRemoteStreamRemoved(event) {
    console.log('Remote stream removed. Event: ', event);
}

function hangup() {
    console.log('Hanging up.');
    stop();
    sendMessage('bye');
}

function handleRemoteHangup(id) {
    console.log('Session terminated.');
    stop(id);
}

function stop(id) {
    commitPc(findPc(id).close(), id)
}


// turn & ice server

var turnReady;


function requestTurn(turnURL) {
    var turnExists = false;
    for (var i in pcConfig.iceServers) {
        if (pcConfig.iceServers[i].urls.substr(0, 5) === 'turn:') {
            turnExists = true;
            turnReady = true;
            break;
        }
    }
    if (!turnExists) {
        console.log('Getting TURN server from ', turnURL);
        // No TURN server. Get one from computeengineondemand.appspot.com:
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var turnServer = JSON.parse(xhr.responseText);
                console.log('Got TURN server: ', turnServer);
                pcConfig.iceServers.push({
                    'urls': 'turn:' + turnServer.username + '@' + turnServer.turn,
                    'credential': turnServer.password
                });
                turnReady = true;
            }
        };
        xhr.open('GET', turnURL, true);
        xhr.send();
    }
}

// Chat functions

function appendMsg(_class, _msg, _name) {
    var text;
    if (_name) {
        text = `<p class="nameSpace">${_name}</p><p>${_msg}</p>`
    } else {
        text = `<p>${_msg}</p>`
    }
    $('#messages').append($(`<li class=${_class}>`).html(text));
}

$(function () {

    // SOCKET
    //script의 attr 가져오기
    // var name = $('#userInfo').attr("name")
    // var room = $('#userInfo').attr("room")
    // var name = prompt('Insert your Nickname')

    $('form').submit(function (e) {
        e.preventDefault();
        var msg = $('#m').val().trim();
        if (msg != "" && msg != null) {
            socket.emit('chatMsg', msg, room);
            appendMsg('me', msg)
        }
        $('#m').val('');
        return false;
    });

    $(document).on('click', '.nameSpace', function () {
        $('.clickMenu').css('display', 'none')
        $(this).append($('<div class="clickMenu">').text('귓속말'))
    })

    $(document).on('click', function (e) {
        if (!$(e.target).is('.nameSpace') && !$(e.target).is('.clickMenu')) {
            $('.clickMenu').css('display', 'none')
        }
    })

})