require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  setup do
    @event = events(:one)
  end

  test "visiting the index" do
    visit events_url
    assert_selector "h1", text: "Events"
  end

  test "should create event" do
    visit events_url
    click_on "New event"

    check "Cost" if @event.cost
    fill_in "Date", with: @event.date
    fill_in "Description", with: @event.description
    fill_in "Location", with: @event.location
    check "Modality" if @event.modality
    fill_in "Name", with: @event.name
    fill_in "Portrait", with: @event.portrait
    fill_in "Speaker", with: @event.speaker
    click_on "Create Event"

    assert_text "Event was successfully created"
    click_on "Back"
  end

  test "should update Event" do
    visit event_url(@event)
    click_on "Edit this event", match: :first

    check "Cost" if @event.cost
    fill_in "Date", with: @event.date
    fill_in "Description", with: @event.description
    fill_in "Location", with: @event.location
    check "Modality" if @event.modality
    fill_in "Name", with: @event.name
    fill_in "Portrait", with: @event.portrait
    fill_in "Speaker", with: @event.speaker
    click_on "Update Event"

    assert_text "Event was successfully updated"
    click_on "Back"
  end

  test "should destroy Event" do
    visit event_url(@event)
    click_on "Destroy this event", match: :first

    assert_text "Event was successfully destroyed"
  end
end