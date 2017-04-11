/**
 * Created by lenovo on 2017/4/11.
 */
window.onload = function () {
    var olis = document.getElementsByName("sel");
    for (var i = 0; i < olis.length; i++) {
        olis[i].index = i;
        olis[i].onclick = function () {
            for (var j = 0; j < olis.length; j++) {
                document.getElementById("tab-" + j).className = "none";
                olis[j].className = "btn btn-default";
            }
            document.getElementById("tab-" + this.index).className = "block";
            olis[this.index].className = "btn btn-info";
        }
    }
}
