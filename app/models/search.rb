class Search < ApplicationRecord
  def jobs
    # You don't need ||= because of Rails SQL caching.
    @jobs = find_jobs
  end
  
  private

  def find_jobs
    jobs = Job.order(:city_id)
    jobs = jobs.where("city_id like ?", "%#{keywords}%") if keywords.present?
    jobs = jobs.where(profession_id: profession_id) if profession_id.present?
    jobs = jobs.where(degree_id: degree_id) if degree_id.present?
    jobs = jobs.where(city_id: city_id) if city_id.present?
    jobs = jobs.where(advertise_id: advertise_id) if advertise_id.present?
    jobs
  end
end
