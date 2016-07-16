#= require active_admin/base
#= require moment
#= require fullcalendar

$ ->
  $('#calendar-admin').fullCalendar {
    events: '/orders.json?admin=true'
    displayEventTime: false
    eventColor: '#ffffff'
  }
