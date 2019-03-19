$(function(){
    var clickedVer = false;
    var clickedDesver = false;
    
    $("#botao-ver").click(function(){
        if (clickedVer == false) {
           $("#botao-ver").addClass("d-none");
           $("#botao-desver").removeClass("d-none");
           $.ajax({
                method: "GET",
                url: "/post/comments/load",
                data: { post_id: $("#post-id").html() },
                success: function(html) {
                    $("#comments").append("<hr>");
                    $("#comments").append(html);
                    
                }
            });
            clickedVer = true;
            clickedDesver = false;
        };
        $("#botao-desver").removeClass("d-none");
    });
    
    $("#botao-desver").click(function(){
        if (clickedDesver == false) {
            $("#botao-desver").addClass("d-none");
            $("#botao-ver").removeClass("d-none");
            $("#comments").empty();
            clickedDesver = true;
            clickedVer = false;
        };
    });
    
    $("#botao-comentar").click(function(){
        $("#botao-comentar").addClass("d-none");
        $.ajax({
            method: "GET",
            url: "/post/comment/new",
            data: {post_id: $("#post-id").html()},
            success: function(html) {
                $("#setor-comentario").append(html);
            }
        });
    });
})


