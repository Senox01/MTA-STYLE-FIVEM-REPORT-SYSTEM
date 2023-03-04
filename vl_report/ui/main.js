$(function() {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        const date = new Date();
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })

    $("#close").click(function() {
        $.post('https://vl_report/exit', JSON.stringify({}));
        return
    })
    $("#send").click(function() {
        let inputValue = $("#text").val()
        if (inputValue.length >= 100) {
            $.post("https://vl_report/error", JSON.stringify({
                error: "Input was greater than 100"
            }))
            return
        } else if (!inputValue) {
            $.post("https://vl_report/error", JSON.stringify({
                error: "There was no value in the input field"
            }))
            return
        }
        $.post('https://vl_report/main', JSON.stringify({
            text: inputValue,
        }));
        return;
    })
})