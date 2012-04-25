    var browse_calender = function()
    {
        jQuery("table a").click(function(){
        val_at = $(this).attr('id');
        current_day = "day_"+val_at;
        if ($("#"+current_day).val()== "")
            {
                $("#"+current_day).val(val_at);
                $(this).addClass('set');
            }
        else
            {
                $("#"+current_day).val('');
                $(this).removeClass('set');
            }
        })
    }

jQuery(document).ready(function(){
            $('#txtDateFrom,#txtDateTo').datepicker({
                changeYear: true,
                beforeShow: function (textbox, instance) {
                instance.dpDiv.css({
                    marginTop: (-textbox.offsetHeight) + 'px',
                    marginLeft: textbox.offsetWidth + 'px'
                });
                }
            });

    $("#leave_start_date").datepicker({
        dateFormate : 'dd-mm-yy'
    });

    $("#leave_end_date").datepicker({
        dateFormate : 'dd-mm-yy'
    });

    $("#user_joining_date").datepicker({
        dateFormate : 'dd-mm-yy'
    });

})
