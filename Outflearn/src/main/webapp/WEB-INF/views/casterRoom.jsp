<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Outflearn</title>

    <link rel="stylesheet" href="/css/main.css" />

</head>

<body>

    <div id="videos">
        <video id="localVideo" autoplay muted playsinline></video>
    </div>

    <div id="chat">
        <ul id="messages"></ul>
        <div class="div-button-send">
            <form action="">
                <input id="m" autocomplete="off" /><button>전 송</button>
            </form>
        </div>
    </div>

    <!-- This file is automatically added/served when running "node index.js". -->
  	<script src="https://192.168.10.139:3000/socket.io/socket.io.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
    <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
    
  	<script src="https://192.168.10.139:3000/js/main.js"></script>
    
</body>

</html>