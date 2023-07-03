// Tự động ẩn thông báo sau 3 giây
setTimeout(function () {
    var customAlert = document.getElementById('custom-alert');
    if (customAlert) {
        customAlert.style.display = 'none';
    }
}, 2000);