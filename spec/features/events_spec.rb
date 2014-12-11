require 'rails_helper'

feature "Events" do


#CREATE
  scenario 'User can create an event' do


    visit root_path
    click_on "New Event"
    fill_in "Description", with: "My awesome event"
    click_on "Create Event"

    expect(page).to have_content("My awesome event")

  end



#Edit
  scenario "User edits an event" do

    Event.create!(
    description: "My aweeesome event"
    )

    visit root_path
    expect(page).to have_content("My aweeesome event")
    click_on "edit"
    fill_in "Description", with: "My awesome event"
    click_on "Update Event"

    expect(page).to have_content("My awesome event")
    expect(page).to have_no_content("My aweeesome event")
  end

#READ
  scenario "listing events" do

    Event.create!(
    description: "free lunch today",
    )

    Event.create!(
    description: "Afternoon tea hour",
    )

    Event.create!(
    description: "Taco Festival",
    )

    visit root_path

    expect(page).to have_content("free lunch today")
    expect(page).to have_content("Afternoon tea hour")
    expect(page).to have_content("Taco Festival")
  end

#DELETE
  scenario 'delete an event' do

    Event.create!(
    description: "Im going to be deleted"
    )

    visit root_path
    click_on "delete"

    expect(page).to have_no_content("Im going to be deleted")
    expect(page.current_path).to eq(events_path)
  end



end
