<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        *{
            box-sizing: border-box;
            margin: 0px auto;
            list-style: none;
            text-decoration: none;
            color: black;
        }
        .wrap{
            width: 1000px;
            height: 700px;
        }

        /* 헤더영역 */
        .wrap header{
            width: 100%;
            height: 120px;
        }
        .wrap #logo {
            width: 100%;
            height: 90px;
            margin-top: 10px;
        }
        .wrap #logo #icon{
            float: left;
            width: 200px;
            height: 100%;
            text-align: center;
        }
        .wrap #logo #title{
            float: left;
            width: 800px;
            height: 100%;
            text-align: center;
        }
        
        .wrap nav ul{
            padding-left: 0px;
        }
        .wrap nav ul li{
            width: 25%;
            height: 30px;
            background-color: green;
            float: left;
        }
        .wrap nav ul a{
            display: inline-block;
            width: 100%;
            height: 100%;
            background-color: green;
            text-align: center;
            line-height: 30px;
            color: aliceblue;
        }
        .wrap nav ul a:hover{
            background-color: darkgreen;
        }

        main{
            width: 100%;
            height: 500px;
            margin-top: 40px;
        }
        

        #leftside{
            width: 200px;
            height: 100%;
            float: left;
            background: url(images/left_img.jpg) no-repeat center center;
            background-size: cover;

        }
        #maincontent{
            width: 550px;
            height: 100%;
            float: left;
        }
        #rightside{
            width: 250px;
            height: 100%;
            float: left;
        }
        /* 오른쪽 로그인 */
        #rightside .side1{
            width: 250px;
            height: 100px;
        }
        #rightside .loginbox{
            width: 250px;
            height: 80px;
            background-color: aqua;
        }
        #rightside .loginbox #login{
            width: 150px;
            height: 80px;
            background-color: red;
            float: left;
        }
        #rightside .loginbox #login input{
            width: 150px;
            height: 40px;
        }

        #rightside .loginbox #button input{
            width: 100px;
            height: 80px;
        }
        #rightside #info{
            text-align: center;
        }
        #rightside #info a:hover{
            color: aliceblue;
        }

        #rightside .side2{
            width: 100%;
            height: 300px;
            /* background: url(images/right_img.jpg) no-repeat center;
            background-size: cover; */
            margin-top: 5px;
        }
        #rightside .side2 img{
            width: 100%;
            height: 100%;
        }
        #rightside .side3{
            width: 100%;
            height: 100px;
        }
        #rightside .side3 img{
            width: 100%;
            height: 100%;
        }


        /* -----------------------------main---------------------------------- */
        main #maincontent ul{
            padding: 0px;
            width: 550px;
            height: 500px;
        }
        main #maincontent ul li{
            width: 50%;
            height: 50%;
            float: left;
            padding: 10px;
            text-align: center;
        }
        main #maincontent ul li img{
            width: 100%;
        }
    </style>
</head>
<body> 
    <div class="wrap">
        <header id='logo'>
            <div id='icon'><img src="images/logo.jpg" alt=""></div>
            <div id='title'><img src="images/mainlogo.jpg" alt=""></div>
            <nav>
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Protile</a></li>
                    <li><a href="#">Board</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </nav>
        </header>
        
        <main>
            <aside id='leftside'>

            </aside>
            <div id='maincontent'>
                <ul>
                    <li><img src="images/main_img1.jpg" alt="">나무를 심는 사람들</li>
                    <li><img src="images/main_img2.jpg" alt="">아이들에게 녹색 미래를..</li>
                    <li><img src="images/main_img3.jpg" alt="">설악산을 사리는 길</li>
                    <li><img src="images/main_img4.jpg" alt="">사라지는 북극곰들</li>
                </ul>
            </div>

            <aside id='rightside'>
                <div class='side1'>
                    <div class='loginbox'>
                        <div id='login'>
                            <input type="text" name="userid" id="userid" placeholder='ID를 입력해주세요.'>
                            <input type="password" name="userpw" id="userpw" placeholder='PW를 입력해주세요.'>
                        </div>
                        <div id='button'>
                        <input type="submit" value="로그인">
                        </div>
                    </div>
                    <div id='info'>
                        <a href="">회원가입</a>
                        <a href="">ID찾기</a>
                        <a href="">PW찾기</a>
                    </div>
                </div>

                <div class='side2'>
                    <img src="images/right_img.jpg" alt="">
                </div>

                <div class='side3'>
                    <img src="images/me_chat.jpg" alt="">
                </div>
            </aside>
        </main>        
        <footer>
          <img src="images/footer.jpg" alt="">
        </footer>
    </div>
</body>
</html>