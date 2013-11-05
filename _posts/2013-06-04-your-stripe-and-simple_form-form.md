```
<%= simple_form_for @subscription do |f| %>
  <%= f.hidden_field :plan_id %>
  <%= f.hidden_field :card_token %>

  <%= f.input :card_number, input_html: { name: '' } %>
  <%= f.input :card_code, input_html: { name: '' }, label: 'Security Code on Card (CVV)' %>
  <%= f.input :card_expiration,
    as: :date,
    start_year: Date.today.year,
    end_year: Date.today.year+15,
    discard_day: true,
    add_month_numbers: true,
    order: [:month, :year],
    input_html: { name: '' } %>

  <%= f.button :submit %>
<% end %>
```
