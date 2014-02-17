<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <c:if test="${not empty error}">
		<div class="errorblock">
			Your login attempt was not successful, try again.<br /> Caused :
			${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
		</div>
	</c:if>

<!-- <div id="popupbox">  -->

                <a class="hiddenanchor" id="toregister"></a>
    <a class="hiddenanchor" id="tologin"></a>
    <div class="modal-bg"> </div>
    <div id="wrapper"> 
	<div id="login" class="animate form">
            <form name="f" action="<c:url value='/j_spring_security_check' />" autocomplete="on" method="POST"> 
                <h1>Logga in</h1> 
                <p> 
                    <label for="username" class="uname" data-icon="u" > Anv�ndarnamn eller Email </label>
                    <input type="text" id="username" name="j_username" required type="text" placeholder="myusername or mymail@mail.com"/>
                </p>
                <p> 
                    <label for="password" class="youpasswd" data-icon="p"> L�senord </label>
                      <input type="password" id="password" name="j_password" required type="password" placeholder="eg. X8df!90EO" />
                </p>
                <p class="keeplogin"> 
                    <input type="checkbox" name="_spring_security_remember_me" id="loginkeeping" value="loginkeeping" /> 
                    <label for="loginkeeping">H�ll mig inloggad</label>
                </p>
                <p class="login button"> 
                    <input name="submit" type="submit" value="Logga in" /> 
                </p>

            </form>
            <a class="loginLink" href="#" style="margin-right:20px;">close</a>
           
        </div>

        
               </div><!-- </div></div>  -->
               
              
