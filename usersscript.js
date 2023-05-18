// script.js
document.getElementById("profilePicture").addEventListener("change", function(event) {
    var reader = new FileReader();

    reader.onload = function() {
        var previewImage = document.getElementById("previewImage");
        previewImage.src = reader.result;
    };

    reader.readAsDataURL(event.target.files[0]);
});
