<%@ page contentType="text/html;charset=utf-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <title>회원가입</title>
    <script>
        $(document).ready(function(){
            $('#join').click(function(){
                $('.alert').show()
            })
        });
    </script>
</head>
<body>

<form class="container container-fluid" style="padding:80px; width:700px" action=".">

    <h2 class="text-center">여행지 추천 서비스</h2>
        <fieldset>

            <legend>회원가입</legend>

            <div class="form-group col">
                <label>아이디</label>
                <input type="text" class="form-control" placeholder="아이디를 입력해주세요" name="id">
            </div>


            <div class="form-group col">
                <label>Password</label>
                <input type="password" class="form-control"placeholder="패스워드를 입력해주세요" name="password">
            </div>


            <div class="form-group col">
                <label>이름</label>
                <input type="text" class="form-control" placeholder="이름을 입력해주세요" name="name">
            </div>

            <div class="form-group col">
                <label>이메일</label>
                <input type="email" class="form-control" placeholder="이메일을 입력해주세요" name="email">
            </div>


            <div class="form-group col">
                <label >선호 여행지는?</label>
                <div class="form-check">
                    <label class="form-check-label">
                        <input class="form-check-input" type="checkbox" value="domestic">
                        국내 
                    </label>
                    <br>
                    <label class="form-check-label">
                        <input class="form-check-input" type="checkbox" value="asia">
                        아시아
                    </label>
                       <br>
                       <label class="form-check-label">
                        <input class="form-check-input" type="checkbox" value="europe">
                        유럽 
                    </label>    
                        <br>
                        <label class="form-check-label">
                        <input class="form-check-input" type="checkbox" value="america">
                        미주/중남미
                    </label>
                    <br>
                    <label class="form-check-label">
                        <input class="form-check-input" type="checkbox" value="africa">
                        아프리카
                    </label> <br>
                    <label class="form-check-label">
                        <input class="form-check-input" type="checkbox" value="space">
                        우주 
                    </label><br>
                </div>

            </div>

            <div class="form-group col">
                <label for="exampleTextarea">자기소개</label>
                <textarea class="form-control" id="exampleTextarea" rows="4" placeholder="자기소개를 써주세요"></textarea>
            </div>
            <div class="col">
                <button type="button" class="btn btn-primary" id="join">가입하기</button>
                <button type="reset" class="btn btn-primary" >초기화</button>
                <button type="button" class="btn btn-link" onclick="location.href='index.jsp'">뒤로 가기</button>
            </div>

            <div class="alert alert-dismissible alert-secondary" style="display:none">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>죄송합니다 !</strong> 지금은 회원가입 기능이 제공되지 않습니다.
            </div>
        </fieldset>
</form>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

</body>
</html>
