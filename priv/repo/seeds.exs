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
alias DoiEsper.Entities.City
alias DoiEsper.Entities.State
alias DoiEsper.Core.Hold

Repo.insert_all(User, [
      %{id: "a9f44567-e031-44f1-aae6-972d7aabbb45", username: "admin",        city: "Rapid City",     state: :SD, f_name: "Jim",    l_name: "Smith",        email: "admin@admin.com",      role: :admin,          hashed_password: Bcrypt.hash_pwd_salt("password"), confirmed_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{id: "b5f44567-e031-44f1-aae6-972d7aabbb45", username: "jim_the_og",   city: "Omaha",          state: :NE, f_name: "Sue",    l_name: "Smith",        email: "Sue@Sue.com",          role: :voter,          hashed_password: Bcrypt.hash_pwd_salt("password"), confirmed_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{id: "df18d5eb-e99e-4481-9e16-4d2f434a3711", username: "aaron",        city: "Lincoln",        state: :NE, f_name: "Ken",    l_name: "Lane",         email: "aaron@aaron.com",      role: :voter,          hashed_password: Bcrypt.hash_pwd_salt("password"), confirmed_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{id: "67bbf29b-7ee9-48a4-b2fb-9a113e26ac91", username: "mn_voter",     city: "Minneapolis",    state: :MN, f_name: "Ken",    l_name: "Lee",          email: "mn_voter@example.com",                        hashed_password: Bcrypt.hash_pwd_salt("password"), confirmed_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{id: "459180af-49aa-48df-92e2-547be9283ac4", username: "wi_voter",     city: "Waupaca",        state: :WI, f_name: "Sue",    l_name: "Saunders",     email: "wi_voter@example.com", role: :candidate,      hashed_password: Bcrypt.hash_pwd_salt("password"), confirmed_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{id: "cf1ffc43-58a2-40e2-b08a-86bb2089ba64", username: "ia_voter",     city: "Ames",           state: :IA, f_name: "Jim",    l_name: "Smith",        email: "ia_voter@example.com", role: :candidate,      hashed_password: Bcrypt.hash_pwd_salt("password"), confirmed_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{id: "4a501cb1-6e1c-45c1-8397-9bbd4a312044", username: "ca_voter",     city: "Sacramento",     state: :CA, f_name: "Jim",    l_name: "Poole",        email: "ca_voter@example.com", role: :candidate,      hashed_password: Bcrypt.hash_pwd_salt("password"), confirmed_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{id: "549a7ba0-ea59-4333-bd01-eb4b3e4420f8", username: "il_voter",     city: "Chicago",        state: :IL, f_name: "Jason",  l_name: "Smith",        email: "il_voter@example.com", role: :candidate,      hashed_password: Bcrypt.hash_pwd_salt("password"), confirmed_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{id: "b2f44567-e031-44f1-aae6-972d7aabbb45", username: "tx_voter",     city: "Austin",         state: :TX, f_name: "Jim",    l_name: "Reynolds",     email: "tx_voter@example.com",                        hashed_password: Bcrypt.hash_pwd_salt("password"), confirmed_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()}
])

Repo.insert_all(TownData, [
      %{year: 2020, code: 1, town: "Andover",   _2010_census: 1317,     gov_assisted: 18, tenant_rental_assistance: 1, chfa_usda_mortgages: 32, deed_restricted: 0, total_assisted: 41, percent_assisted: 3.8699999999999997},
      %{year: 2021, code: 3, town: "Alianda",   _2010_census: 107,      gov_assisted: 11, tenant_rental_assistance: 1, chfa_usda_mortgages: 32, deed_restricted: 0, total_assisted: 51, percent_assisted: 2.7799999999999997},
      %{year: 2020, code: 2, town: "Annapolia", _2010_census: 1311,     gov_assisted: 33, tenant_rental_assistance: 1, chfa_usda_mortgages: 42, deed_restricted: 0, total_assisted: 51, percent_assisted: 6.8699999999999997}

])

# Repo.insert_all("cities", [
Repo.insert_all(City, [
      %{name: "Northfield", population: 1000, latitude: 41.988677, longitude: 3.8574657},
      %{name: "Deer River", population: 3000, latitude: 51.756465, longitude: 2.756697}
])

Repo.insert_all(Attachment, [
      %{id: "a7f44567-e031-44f1-aae6-972d7aabbb45", type: 1, title: "Test Democrat", data: nil, inserted_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now(), path: "https://upload.wikimedia.org/wikipedia/commons/b/bb/PavelTravnicek2022.jpg"},
      %{id: "a5f44567-e031-44f1-aae6-972d7aabbb45", type: 1, title: "Test Republican", data: nil, inserted_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now(), path: "https://upload.wikimedia.org/wikipedia/commons/c/c4/Roy_Dale_Cope.jpg"},
      %{id: "a8f14567-e031-44f1-aae6-972d7aabbb45", type: 1, title: "NE_Rep_2022", data: nil, inserted_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now(), path: "https://upload.wikimedia.org/wikipedia/commons/9/94/Adrian_Smith_116th_Congress.jpg"},
      %{id: "a6f14567-e031-44f1-aae6-972d7aabbb45", type: 1, title: "NE_Rep_2022", data: nil, inserted_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now(), path: "https://upload.wikimedia.org/wikipedia/commons/b/bc/Mike_Flood_117th_Congress_%28cropped%29.jpeg"},
      %{id: "a2f14567-e031-44f1-aae6-972d7aabbb45", type: 1, title: "NE_Rep_2022", data: nil, inserted_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now(), path: "https://upload.wikimedia.org/wikipedia/commons/5/5f/Don_Bacon_portrait_%28118th_Congress%29.jpg"},
      %{id: "a5f44967-e031-44f1-aae6-972d7aabbb45", type: 1, title: "NE_Gov_2018", data: nil, inserted_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now(), path: "https://upload.wikimedia.org/wikipedia/commons/b/bd/Sen._Pete_Ricketts_official_portrait%2C_118th_Congress.jpg"},
      %{id: "a5f88967-e031-44f1-aae6-972d7aabbb45", type: 1, title: "NE_Gov_2022", data: nil, inserted_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now(), path: "https://upload.wikimedia.org/wikipedia/commons/7/72/Jim_Pillen_%28cropped%29.jpg"},
      %{id: "a5f44567-e031-44f1-aae6-972d7aabbb49", type: 1, title: "AK_Gov",       data: nil, inserted_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now(), path: "https://en.wikipedia.org/wiki/Mike_Dunleavy_(politician)#/media/File:Mike_Dunleavy_official_photo.jpg"},
      %{id: "a1f44367-e031-44f1-aae6-972d7aabbb49", type: 1, title: "JulieSlama", data: nil, inserted_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now(), path: "https://upload.wikimedia.org/wikipedia/commons/2/21/Julie_Slama_%2851850518231%29.jpg"},
      %{id: "848dd11c-d924-48e7-bdc2-9db000222365", type: 1, title: "DebF",       data: nil, inserted_at: NaiveDateTime.local_now(), updated_at: NaiveDateTime.local_now(), path: "https://upload.wikimedia.org/wikipedia/commons/9/93/Deb_Fischer_official_Senate_photo.jpg"}
])

Repo.insert_all(State, [
      %{id: 1, name: :Alabama, code: :AL, num_districts: 7, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 2, name: :Alaska, code: :AK, num_districts: 0, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 3, name: :Arizona, code: :AZ, num_districts: 9, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 4, name: :Arkansas, code: :AR, num_districts: 4, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 5, name: :California, code: :CA, num_districts: 52, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 6, name: :Colorado, code: :CO, num_districts: 8, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 7, name: :Connecticut, code: :CT, num_districts: 5, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 8, name: :Delaware, code: :DE, num_districts: 1, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 9, name: :Florida, code: :FL, num_districts: 28, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 10, name: :Georgia, code: :GA, num_districts: 14, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 11, name: :Hawaii, code: :HI, num_districts: 2, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 12, name: :Idaho, code: :ID, num_districts: 2, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 13, name: :Illinois, code: :IL, num_districts: 17, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 14, name: :Indiana, code: :IN, num_districts: 9, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 15, name: :Iowa, code: :IA, num_districts: 4, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 16, name: :Kansas, code: :KS, num_districts: 4, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 17, name: :Kentucky, code: :KY, num_districts: 6, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 18, name: :Louisiana, code: :LA, num_districts: 6, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 19, name: :Maine, code: :ME, num_districts: 2, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 20, name: :Maryland, code: :MD, num_districts: 8, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 21, name: :Massachusetts, code: :MA, num_districts: 9, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 22, name: :Michigan, code: :MI, num_districts: 13, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 23, name: :Minnesota, code: :MN, num_districts: 8, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 24, name: :Mississippi, code: :MS, num_districts: 4, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 25, name: :Missouri, code: :MO, num_districts: 8, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 26, name: :Montana, code: :MT, num_districts: 2, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 27, name: :Nebraska, code: :NE, num_districts: 3, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 28, name: :Nevada, code: :NV, num_districts: 4, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 29, name: :New_Hampshire, code: :NH, num_districts: 4, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 30, name: :New_Jersey, code: :NJ, num_districts: 12, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 31, name: :New_Mexico, code: :NM, num_districts: 3, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 32, name: :New_York, code: :NY, num_districts: 26, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 33, name: :North_Carolina, code: :NC, num_districts: 14, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 34, name: :North_Dakota, code: :ND, num_districts: 3, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 35, name: :Ohio, code: :OH, num_districts: 15, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 36, name: :Oklahoma, code: :OK, num_districts: 5, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 37, name: :Oregon, code: :OR, num_districts: 6, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 38, name: :Pennsylvania, code: :PA, num_districts: 17, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 39, name: :Rhode_Island, code: :RI, num_districts: 2, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 40, name: :South_Carolina, code: :SC, num_districts: 7, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 41, name: :South_Dakota, code: :SD, num_districts: 1, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 42, name: :Tennessee, code: :TN, num_districts: 9, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 43, name: :Texas, code: :TX, num_districts: 38, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 44, name: :Utah, code: :UT, num_districts: 4, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 45, name: :Vermont, code: :VT, num_districts: 4, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 46, name: :Virginia, code: :VA, num_districts: 11, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 47, name: :Washington, code: :WA, num_districts: 10, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 48, name: :West_Virginia, code: :WV, num_districts: 2, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 49, name: :Wisconsin, code: :WI, num_districts: 8, governor: nil, inserted_at: NaiveDateTime.local_now()},
      %{id: 50, name: :Wyoming, code: :WY, num_districts: 1, governor: nil, inserted_at: NaiveDateTime.local_now()}
])

Repo.insert_all(Hold, [
      # Jim went to town and chose them all
      %{user_id: "b5f44567-e031-44f1-aae6-972d7aabbb45", type: :follow, hold_cat: :race, hold_cat_id: "5d99c305-7d3e-4279-acc6-e90764139bc2", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{user_id: "b5f44567-e031-44f1-aae6-972d7aabbb45", type: :alert, hold_cat: :race, hold_cat_id: "5d99c305-7d3e-4279-acc6-e90764139bc2", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{user_id: "b5f44567-e031-44f1-aae6-972d7aabbb45", type: :star, hold_cat: :race, hold_cat_id: "5d99c305-7d3e-4279-acc6-e90764139bc2", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{user_id: "b5f44567-e031-44f1-aae6-972d7aabbb45", type: :bookmark, hold_cat: :race, hold_cat_id: "5d99c305-7d3e-4279-acc6-e90764139bc2", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},

      %{user_id: "b5f44567-e031-44f1-aae6-972d7aabbb45", type: :follow, hold_cat: :user, hold_cat_id: "a9f44567-e031-44f1-aae6-972d7aabbb45", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{user_id: "df18d5eb-e99e-4481-9e16-4d2f434a3711", type: :follow, hold_cat: :user, hold_cat_id: "a9f44567-e031-44f1-aae6-972d7aabbb45", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{user_id: "67bbf29b-7ee9-48a4-b2fb-9a113e26ac91", type: :follow, hold_cat: :user, hold_cat_id: "a9f44567-e031-44f1-aae6-972d7aabbb45", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{user_id: "b2f44567-e031-44f1-aae6-972d7aabbb45", type: :follow, hold_cat: :user, hold_cat_id: "a9f44567-e031-44f1-aae6-972d7aabbb45", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      # We got two friends - Jim holds Aaron & Aaron holds Jim
      %{user_id: "b5f44567-e031-44f1-aae6-972d7aabbb45", type: :follow, hold_cat: :user, hold_cat_id: "df18d5eb-e99e-4481-9e16-4d2f434a3711", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{user_id: "df18d5eb-e99e-4481-9e16-4d2f434a3711", type: :follow, hold_cat: :user, hold_cat_id: "b5f44567-e031-44f1-aae6-972d7aabbb45", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      # Aaron chose 2
      # Jim & Aaron subscribe to Pres Election
      %{user_id: "b5f44567-e031-44f1-aae6-972d7aabbb45", type: :follow, hold_cat: :election, hold_cat_id: "bfe75d28-b2eb-4478-82f5-17828f9c82c6", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{user_id: "df18d5eb-e99e-4481-9e16-4d2f434a3711", type: :follow, hold_cat: :election, hold_cat_id: "bfe75d28-b2eb-4478-82f5-17828f9c82c6", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      # Aaron chose 2
      # Jim like Mike & Mirch & Sarah because WTF radio
      %{user_id: "b5f44567-e031-44f1-aae6-972d7aabbb45", type: :vote, hold_cat: :candidate, hold_cat_id: "0e91778f-503f-4218-a801-c8bb7ff9498b", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{user_id: "b5f44567-e031-44f1-aae6-972d7aabbb45", type: :vote, hold_cat: :candidate, hold_cat_id: "0ce64757-3bf2-4779-99ca-3b5b35d59c4d", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{user_id: "b5f44567-e031-44f1-aae6-972d7aabbb45", type: :vote, hold_cat: :candidate, hold_cat_id: "049acd0a-427b-4096-8cd5-1ce59845649e", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{user_id: "b5f44567-e031-44f1-aae6-972d7aabbb45", type: :vote, hold_cat: :candidate, hold_cat_id: "09f131ac-818c-4058-b9ce-dc3b91794416", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      # Post Holds Jim & Aaron
      %{user_id: "b5f44567-e031-44f1-aae6-972d7aabbb45", type: :upvote, hold_cat: :post, hold_cat_id: "956c5b4f-f1a1-42f0-b04d-bd80eddbe997", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{user_id: "b5f44567-e031-44f1-aae6-972d7aabbb45", type: :upvote, hold_cat: :post, hold_cat_id: "59e92082-6cc8-435d-9e71-59d3c89c9867", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{user_id: "b5f44567-e031-44f1-aae6-972d7aabbb45", type: :upvote, hold_cat: :post, hold_cat_id: "566f949a-be08-49e7-9c60-0c33d55b791b", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{user_id: "b5f44567-e031-44f1-aae6-972d7aabbb45", type: :upvote, hold_cat: :post, hold_cat_id: "1f310d22-6abb-4b9f-942a-53aafd7f2006", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{user_id: "b5f44567-e031-44f1-aae6-972d7aabbb45", type: :upvote, hold_cat: :post, hold_cat_id: "9de1ea76-ce5a-447f-a809-7b62dcbfa3a7", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{user_id: "df18d5eb-e99e-4481-9e16-4d2f434a3711", type: :upvote, hold_cat: :post, hold_cat_id: "566f949a-be08-49e7-9c60-0c33d55b791b", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      # Thread Holds Jim & Aaron
      %{user_id: "b5f44567-e031-44f1-aae6-972d7aabbb45", type: :share, hold_cat: :thread, hold_cat_id: "208272e9-1765-451f-9acb-79699ce5fc25", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{user_id: "df18d5eb-e99e-4481-9e16-4d2f434a3711", type: :share, hold_cat: :thread, hold_cat_id: "208272e9-1765-451f-9acb-79699ce5fc25", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{user_id: "b5f44567-e031-44f1-aae6-972d7aabbb45", type: :like, hold_cat: :thread, hold_cat_id: "4fd6aa47-51da-4277-bca6-3a87b2153c20", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{user_id: "df18d5eb-e99e-4481-9e16-4d2f434a3711", type: :like, hold_cat: :thread, hold_cat_id: "4fd6aa47-51da-4277-bca6-3a87b2153c20", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      # Favorites for Jim & Aaron
      %{user_id: "b5f44567-e031-44f1-aae6-972d7aabbb45", type: :favorite, hold_cat: :thread, hold_cat_id: "208272e9-1765-451f-9acb-79699ce5fc25", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{user_id: "b5f44567-e031-44f1-aae6-972d7aabbb45", type: :favorite, hold_cat: :post, hold_cat_id: "566f949a-be08-49e7-9c60-0c33d55b791b", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{user_id: "b5f44567-e031-44f1-aae6-972d7aabbb45", type: :favorite, hold_cat: :user, hold_cat_id: "df18d5eb-e99e-4481-9e16-4d2f434a3711", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()},
      %{user_id: "df18d5eb-e99e-4481-9e16-4d2f434a3711", type: :favorite, hold_cat: :thread, hold_cat_id: "4fd6aa47-51da-4277-bca6-3a87b2153c20", updated_at: NaiveDateTime.local_now(), inserted_at: NaiveDateTime.local_now()}
])

# # Ecto.UUID.bingenerate()
