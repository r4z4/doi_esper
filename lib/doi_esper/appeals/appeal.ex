defmodule DoiEsper.Appeals.Appeal do
  use Ecto.Schema
  import Ecto.Changeset

  schema "appeal" do
    field :data, :binary
    field :desc, :string
    field :individual_shop, :integer
    field :exchange_type, :integer
    field :state, :integer
    field :issuer_name, :integer
    field :issuer_id, :integer
    field :is_issuer_new_to_exchange?, :integer
    field :sadp_only, :integer
    field :plan_id, :integer
    field :new_or_returning_plan, :integer
    field :plan_type, :integer
    field :qhp_sadp?, :integer
    field :metal_level, :integer
    field :url_claims_payment_policies, :integer
    field :issuer_claims_received_in_network, :integer
    field :issuer_claims_received_out_of_network, :integer
    field :issuer_claims_denied_in_network, :integer
    field :issuer_claims_denied_out_of_network, :integer
    field :issuer_claims_resubmitted_in_network, :integer
    field :issuer_claims_resubmitted_out_of_network, :integer
    field :issuer_internal_appeals_filed, :integer
    field :issuer_number_internal_appeals_overturned, :integer
    field :issuer_percent_internal_appeals_overturned, :integer
    field :issuer_external_appeals_filed, :integer
    field :issuer_number_external_appeals_overturned, :integer
    field :issuer_percent_external_appeals_overturned, :integer
    field :plan_number_claims_received_in_network, :integer
    field :plan_number_claims_received_out_of_network, :integer
    field :plan_number_claims_denied_in_network, :integer
    field :plan_number_claims_denied_out_of_network, :integer
    field :plan_number_claims_resubmitted_in_network, :integer
    field :plan_number_claims_resubmitted_out_of_network, :integer
    field :plan_number_claims_denied_referral_required, :integer
    field :plan_number_claims_denied_services_excluded, :integer
    field :plan_number_claims_denied_not_medically_necessary_excluding_behavioral_health, :integer
    field :plan_number_claims_denied_not_medically_necessary_behavioral_health_only, :integer
    field :plan_number_claims_denied_due_to_enrolle_benefit_limit_reached, :integer
    field :plan_number_claims_denied_due_to_member_not_covered, :integer
    field :plan_number_claims_denied_due_to_investigational_experimental_cosmetic_proceduce, :integer
    field :plan_number_claims_denied_due_to_administrative_reason, :integer
    field :plan_number_claims_denied_other, :integer
    field :rate_review, :integer
    field :financial_information, :integer
    field :enrollment_data, :integer
    field :disenrollment_data, :integer

    timestamps()
  end

  @doc false
  def changeset(appeal, attrs) do
    appeal
    |> cast(attrs, [:id, :desc, :data])
    |> validate_required([:id, :desc, :data])
  end
end
