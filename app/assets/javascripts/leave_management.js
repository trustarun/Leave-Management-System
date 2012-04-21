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