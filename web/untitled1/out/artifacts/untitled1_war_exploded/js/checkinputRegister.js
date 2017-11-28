/**
 * Created by wxy on 2017/4/12.
 */
var validityPwd = function(){//确认输入密码是否一致
    var newPwd = document.getElementById('newPwd');
    var newPwdConfirm = document.getElementById('newPwdConfirm');
    if(newPwd.value != newPwdConfirm.value){
        newPwdConfirm.setCustomValidity('两次密码输入不一致');
    }else{
        newPwdConfirm.setCustomValidity('');
    }
}
