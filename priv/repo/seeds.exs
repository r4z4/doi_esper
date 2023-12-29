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
alias DoiEsper.Accounts.User
alias DoiEsper.Core.Attachment

Repo.insert_all(User, [
      %{id: "a9f44567-e031-44f1-aae6-972d7aabbb45", username: "admin", city: "Rapid City", state: :SD, district: nil, email: "admin@admin.com", role: :admin, hashed_password: Bcrypt.hash_pwd_salt("password"), confirmed_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{id: "b5f44567-e031-44f1-aae6-972d7aabbb45", username: "jim_the_og", city: "Omaha", state: :NE, district: nil, email: "jim@jim.com", role: :voter, hashed_password: Bcrypt.hash_pwd_salt("password"), confirmed_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{id: "df18d5eb-e99e-4481-9e16-4d2f434a3711", username: "aaron", city: "Lincoln", state: :NE, district: nil, email: "aaron@aaron.com", role: :voter, hashed_password: Bcrypt.hash_pwd_salt("password"), confirmed_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{id: "67bbf29b-7ee9-48a4-b2fb-9a113e26ac91", username: "mn_voter", city: "Minneapolis", state: :MN, district: nil, email: "mn_voter@example.com", hashed_password: Bcrypt.hash_pwd_salt("password"), confirmed_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{id: "459180af-49aa-48df-92e2-547be9283ac4", username: "wi_voter", city: "Waupaca", state: :WI, district: nil, email: "wi_voter@example.com", role: :candidate, hashed_password: Bcrypt.hash_pwd_salt("password"), confirmed_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{id: "cf1ffc43-58a2-40e2-b08a-86bb2089ba64", username: "ia_voter", city: "Ames", state: :IA, district: nil, email: "ia_voter@example.com", role: :candidate, hashed_password: Bcrypt.hash_pwd_salt("password"), confirmed_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{id: "4a501cb1-6e1c-45c1-8397-9bbd4a312044", username: "ca_voter", city: "Sacramento", state: :CA, district: nil, email: "ca_voter@example.com", role: :candidate, hashed_password: Bcrypt.hash_pwd_salt("password"), confirmed_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{id: "549a7ba0-ea59-4333-bd01-eb4b3e4420f8", username: "il_voter", city: "Chicago", state: :IL, district: nil, email: "il_voter@example.com", role: :candidate, hashed_password: Bcrypt.hash_pwd_salt("password"), confirmed_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{id: "b2f44567-e031-44f1-aae6-972d7aabbb45", username: "tx_voter", city: "Austin", state: :TX, district: nil, email: "tx_voter@example.com", hashed_password: Bcrypt.hash_pwd_salt("password"), confirmed_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()}
])

Repo.insert_all(TownData, [
      %{year: 2020, code: 1, town: "Andover", _2010_census: 1317, gov_assisted: 18, tenant_rental_assistance: 1, chfa_usda_mortgages: 32, deed_restricted: 0, total_assisted: 41, percent_assisted: 3.8699999999999997},
      %{year: 2021, code: 3, town: "Alianda", _2010_census: 107, gov_assisted: 11, tenant_rental_assistance: 1, chfa_usda_mortgages: 32, deed_restricted: 0, total_assisted: 51, percent_assisted: 2.7799999999999997},
      %{year: 2020, code: 2, town: "Annapolia", _2010_census: 1311, gov_assisted: 33, tenant_rental_assistance: 1, chfa_usda_mortgages: 42, deed_restricted: 0, total_assisted: 51, percent_assisted: 6.8699999999999997}

])

Repo.insert_all(Attachment, [
      %{id: "a7f44567-e031-44f1-aae6-972d7aabbb45", type: 1, title: "Test Democrat", path: "https://upload.wikimedia.org/wikipedia/commons/b/bb/PavelTravnicek2022.jpg", data: nil, inserted_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now()},
      %{id: "a5f44567-e031-44f1-aae6-972d7aabbb45", type: 1, title: "Test Republican", path: "https://upload.wikimedia.org/wikipedia/commons/c/c4/Roy_Dale_Cope.jpg", data: nil, inserted_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now()},
      %{id: "a8f14567-e031-44f1-aae6-972d7aabbb45", type: 1, title: "NE_Rep_2022", path: "https://upload.wikimedia.org/wikipedia/commons/9/94/Adrian_Smith_116th_Congress.jpg", data: nil, inserted_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now()},
      %{id: "a6f14567-e031-44f1-aae6-972d7aabbb45", type: 1, title: "NE_Rep_2022", path: "https://upload.wikimedia.org/wikipedia/commons/b/bc/Mike_Flood_117th_Congress_%28cropped%29.jpeg", data: nil, inserted_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now()},
      %{id: "a2f14567-e031-44f1-aae6-972d7aabbb45", type: 1, title: "NE_Rep_2022", path: "https://upload.wikimedia.org/wikipedia/commons/5/5f/Don_Bacon_portrait_%28118th_Congress%29.jpg", data: nil, inserted_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now()},
      %{id: "a5f44967-e031-44f1-aae6-972d7aabbb45", type: 1, title: "NE_Gov_2018", path: "https://upload.wikimedia.org/wikipedia/commons/b/bd/Sen._Pete_Ricketts_official_portrait%2C_118th_Congress.jpg", data: nil, inserted_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now()},
      %{id: "a5f88967-e031-44f1-aae6-972d7aabbb45", type: 1, title: "NE_Gov_2022", path: "https://upload.wikimedia.org/wikipedia/commons/7/72/Jim_Pillen_%28cropped%29.jpg", data: nil, inserted_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now()},
      %{id: "a5f44567-e031-44f1-aae6-972d7aabbb49", type: 1, title: "AK_Gov", path: "https://en.wikipedia.org/wiki/Mike_Dunleavy_(politician)#/media/File:Mike_Dunleavy_official_photo.jpg", data: nil, inserted_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now()},
      %{id: "a1f44367-e031-44f1-aae6-972d7aabbb49", type: 1, title: "JulieSlama", path: "https://upload.wikimedia.org/wikipedia/commons/2/21/Julie_Slama_%2851850518231%29.jpg", data: nil, inserted_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now()},
      %{id: "848dd11c-d924-48e7-bdc2-9db000222365", type: 1, title: "DebF", path: "https://upload.wikimedia.org/wikipedia/commons/9/93/Deb_Fischer_official_Senate_photo.jpg", data: nil, inserted_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now()}
])

# # Ecto.UUID.bingenerate()
