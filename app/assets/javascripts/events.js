function show_new_location()
{
    document.getElementById('new_location').style.display='block';
    document.getElementById('location_select').style.display='none';
    document.getElementById("location_selection").value = "1";
}

function show_location_select()
{
    document.getElementById('location_select').style.display='block';
    document.getElementById('new_location').style.display='none';
    document.getElementById("location_selection").value = "0";
}
