export default function()  {
  $.ajax("/api").done((data)=> {
    $("#countdown")
      .countdown(data.next_paydate, function(event) {
	$(this).text(
	  event.strftime('%D %H %M %S')
	);
      });
  });
};
