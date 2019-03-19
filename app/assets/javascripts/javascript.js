$(function(){
    var clicked = false;
    
    $("#botao").click(function(){
        if (clicked == false) {
           $.ajax({
                method: "GET",
                url: "/post/comments/load",
                data: { post_id: $("#post-id").html() },
                success: function(html) {
                    $("#comments").append(html);
                    $("#disapear").addClass("d-none");
                }
            }); 
            clicked = true;
        };
    });

})


