# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     DoiEsper.Repo.insert!(%DoiEsper.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     EmerPhx.Repo.insert!(%EmerPhx.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# 8d04fd4f-1321-4e9f-911a-7369d57d0b55

alias DoiEsper.Repo
alias DoiEsper.Sales.TownData


Repo.insert_all(TownData, [
      %{year: 2020, code: 1, town: "Andover", _2010_census: 1317, gov_assisted: 18, tenant_rental_assistance: 1, chfa_usda_mortgages: 32, deed_restricted: 0, total_assisted: 41, percent_assisted: 3.8699999999999997},
      %{year: 2021, code: 3, town: "Alianda", _2010_census: 107, gov_assisted: 11, tenant_rental_assistance: 1, chfa_usda_mortgages: 32, deed_restricted: 0, total_assisted: 51, percent_assisted: 2.7799999999999997},
      %{year: 2020, code: 2, town: "Annapolia", _2010_census: 1311, gov_assisted: 33, tenant_rental_assistance: 1, chfa_usda_mortgages: 42, deed_restricted: 0, total_assisted: 51, percent_assisted: 6.8699999999999997}

])

# # Ecto.UUID.bingenerate()
