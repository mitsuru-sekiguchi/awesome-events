100.times do |i|
  start_at = Time.current
  Event.create!(name: "イベント名#{i}",
                place: "イベント開催場所#{i}",
                content: "イベント本文#{i}",
                start_at: start_at + 1.day,
                end_at: start_at + 1.day + 3.hour,
                owner_id: 1
               )
end
