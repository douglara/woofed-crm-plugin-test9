class Accounts::WorldTimesController < InternalController
  def index
    @time_zones = [
      { name: 'Sao Paulo', zone: 'America/Sao_Paulo', country: 'BR' },
      { name: 'Brisbane', zone: 'Australia/Brisbane', country: 'AU' },
      { name: 'New York', zone: 'America/New_York', country: 'US' }
    ]

    @times = @time_zones.map do |tz|
      time = Time.now.in_time_zone(tz[:zone])
      {
        name: tz[:name],
        zone: tz[:zone],
        country: tz[:country],
        date: time.strftime('%Y-%m-%d'),
        time: time.strftime('%H:%M:%S'),
        day_of_week: time.strftime('%A'),
        utc_offset: time.formatted_offset
      }
    end
  end
end
