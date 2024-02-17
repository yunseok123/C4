   // 카카오 SDK 초기화
    Kakao.init('8d06527d298427983d1f6087ccf550b1');

 // 카카오 로그인 버튼에 이벤트 연결
    function loginWithKakao() {
        Kakao.Auth.login({
            success: function(authObj) {
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function(res) {
                        var xhr = new XMLHttpRequest();
                        xhr.open("POST", "Login.jsp", true);
                        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                        xhr.onreadystatechange = function() {
                            if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
                                window.location.href = 'main.jsp';
                            }
                        }
                        xhr.send("nickname=" + encodeURIComponent(res.properties.nickname) + 
                                 "&profileImage=" + encodeURIComponent(res.properties.profile_image));
                    },
                    fail: function(error) {
                        console.error('Failed to get user info:', error);
                    }
                });
            },
            fail: function(err) {
                console.error('Kakao login failed:', err);
            }
        });
    }
