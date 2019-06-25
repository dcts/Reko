# SCRIPT TO DELETE FILES ON SERVER
user_ids = [18,26,28,19,10,20,21,22,24,27,35,53,57,60,61,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,123]
user_ids.each { |user_id| User.find(user_id).delete }

# 18  Thil  Lamm  thilo@example.com 0 1_E9NRSdwYL2jp906LtIog  user  2019-05-31 13:50:04 UTC 2019-06-05 18:40:33 UTC
# 26  Thilo Lammers thilo.lammers@googlemail.com  0 M3t1NOm2ZeGk2ITtCbN41Q  user  2019-06-03 19:04:05 UTC 2019-06-05 18:40:33 UTC
# 28  Thilo Lammers thilo.lammers@gmx.de  59  doWij5DvxV5ZtFo9WpfenA  user  2019-06-03 19:20:27 UTC 2019-06-15 20:56:05 UTC
# 19  Allan Holmes  justpro7@gmail.com  8 jmtYyxBVsQAs9Dlb-h--vg  user  2019-05-31 13:51:59 UTC 2019-06-05 18:40:33 UTC
# 10  Allan Holmes  allan.homes@me.com  0 SDx4X4ZjftUvYMhqy2WXNQ  admin 2019-05-31 13:19:55 UTC 2019-06-05 18:40:33 UTC
# 20  Allan Holmes  a@aaa.com 3 s7F9coFrAKrox7QTEjJBug  user  2019-05-31 14:16:07 UTC 2019-06-05 18:40:33 UTC
# 21  Buddy Holmes  no@no.com 0 H2OCVQpnYjUo6BX15-a3mQ  user  2019-05-31 14:38:43 UTC 2019-06-05 18:40:33 UTC
# 22  Allan Holmes  justpro67@gmail.com 12  aHCvMwTwL6oxjX5byea2Dg  user  2019-05-31 15:13:04 UTC 2019-06-05 18:40:33 UTC
# 24  Allan Holmes  nono@no.com 4 zD5L_EPvunVvS3sJgeXB5w  user  2019-05-31 20:31:28 UTC 2019-06-05 18:40:33 UTC
# 27  Allan Holmes  allan.holmes@me.com 61  SfL00hYbRFDsiJZWcxVDgA  user  2019-06-03 19:20:15 UTC 2019-06-19 22:12:33 UTC
# 35  Thomas  Starz thomas.starzynski@unibas.ch 3 fyy21QQvhe9hDGsIZ78Y6g  user  2019-06-05 04:16:39 UTC 2019-06-05 18:40:33 UTC
# 53  Assunta Test  babab@babanab.com 5 wuJuugvUOBuJOYtzJ-BIOg  user  2019-06-06 07:51:25 UTC 2019-06-06 07:51:25 UTC
# 57  HEHE  Bdhd  beta@brta.com 5 BnDqv-Fi0XDg139h_uW3zg  user  2019-06-06 13:15:24 UTC 2019-06-06 13:21:37 UTC
# 60  Allan Holmes  allan.ho@holmes.com 5 y79WaGDWDx-EbVQ8w05rGg  user  2019-06-06 14:55:21 UTC 2019-06-06 14:55:21 UTC
# 61  Allan Holmes  qwe@example.com 13  TB7HiVO3X_UzdbBUOL2E8w  user  2019-06-06 15:50:15 UTC 2019-06-06 15:50:15 UTC
# 66  Allan Holmes  abc@example.com 5 fEAaUFADkS1H8YuwCJzw0w  user  2019-06-07 08:22:35 UTC 2019-06-07 16:06:54 UTC
# 67  T T t@t.com 0 Em6uyinWo_B9jNZzESWLlg  user  2019-06-07 08:31:15 UTC 2019-06-07 08:31:15 UTC
# 68  Allan Holmes  sheh@example.com  1 IDCHVAaw5EkhSRlTPtzF8w  user  2019-06-07 08:38:49 UTC 2019-06-07 08:38:49 UTC
# 69  Allan Holmes  j@jj.com  1 Yz8pHXg-Yea8-GMAo1hoFg  user  2019-06-07 08:49:13 UTC 2019-06-07 08:49:13 UTC
# 70  Sndjd Dndjjd  j@j.com 1 SevFZ_4svrPtacSBvsIFBQ  user  2019-06-07 08:54:02 UTC 2019-06-07 08:54:02 UTC
# 71  Djdj  Sjdjsn  hejej@example.com 0 3B_3s6sEeosk3pheJbp_fQ  user  2019-06-07 08:55:42 UTC 2019-06-07 08:55:42 UTC
# 72  Allan Holmes  allan@allannn.com 0 5fQhBFntES-goembllBbrw  user  2019-06-07 08:57:32 UTC 2019-06-07 08:57:32 UTC
# 73  Djdj  Sjdjsn  djdjdjej@example.com  0 FPbRL4Gzvd0siJfiiFGQEQ  user  2019-06-07 08:57:59 UTC 2019-06-07 08:57:59 UTC
# 74  Allan Holmes  trt@hhhh  1 EwR66m6J4YlafZf3GTkG1A  user  2019-06-07 08:58:29 UTC 2019-06-07 08:58:29 UTC
# 75  Allan Holmes  allan.holmess@me.com  1 f59ARP4x2Mui4RGmnCVpMg  user  2019-06-07 08:59:54 UTC 2019-06-07 08:59:54 UTC
# 76  Allan Holmes  shshs@example.com 5 nIk50lUAUOw8GiNewDWhPQ  user  2019-06-07 09:10:19 UTC 2019-06-07 09:10:19 UTC
# 77  Allan Holmes  ggggg@allan.com 5 Cg-mPr_DQp1cVz3L6Dhb9Q  user  2019-06-07 09:29:07 UTC 2019-06-07 09:35:00 UTC
# 78  Allan Holmes  admin435@admin.com  6 XaZzz0Gv8fYd3qfqVV-Phw  user  2019-06-07 10:28:42 UTC 2019-06-07 10:39:59 UTC
# 79  Allan Holmes  allan@holmess.com 1 sNygfE-YC-zKDVt6R8bcTg  user  2019-06-07 10:46:28 UTC 2019-06-07 10:46:28 UTC
# 80  Allan Holmes  allan@homes.com 5 gUOIasDzJlhSfVjezzDbaQ  user  2019-06-07 11:01:52 UTC 2019-06-07 11:01:52 UTC
# 81  Allan Holmes  shanajs.a@example.com 5 mOkhn3rx7lFSE3-Ou64HDA  user  2019-06-07 14:52:21 UTC 2019-06-07 14:52:21 UTC
# 82  Allan Holmes  haha@ahhs.com 1 ea0hgaTypFSd1Rjp5e5NXg  user  2019-06-07 15:01:34 UTC 2019-06-07 15:01:34 UTC
# 83  Allan Holmes  allllllan@in.com  5 TrXjSFjBOHv0i9h5J3qJpw  user  2019-06-07 15:05:24 UTC 2019-06-07 15:05:24 UTC
# 84  A H djdjd@djdi.com  1 Vfl_D0UU_R17utflHCCrpQ  user  2019-06-07 15:08:28 UTC 2019-06-07 15:08:28 UTC
# 85  Allan Holmes  andy@reko.com 5 axGxy6CHA3NWBoJ2J5iaFg  user  2019-06-07 16:03:29 UTC 2019-06-07 16:03:29 UTC
# 86  Allan Holmes  djdjdidj@shdjd.com  1 PGEdfDu0EHMuttTlBf75OQ  user  2019-06-07 16:12:44 UTC 2019-06-07 16:12:44 UTC
# 87  Allan Holmes  alllllan@a.com  1 YPQw-frPrwfVSPE5OIjB5w  user  2019-06-07 16:21:19 UTC 2019-06-07 16:21:19 UTC
# 88  Allan Holmes  shit@shit.com 5 3ErA6syAsKBJQxU8MPkmBw  user  2019-06-07 16:25:38 UTC 2019-06-07 16:25:38 UTC
# 89  Allan Holmes  allan@reko.com  6 y6N62Ig7QraZ0hRBpEvziw  user  2019-06-07 17:36:11 UTC 2019-06-07 17:36:11 UTC
# 123 Thomas  DCTS  dcts@dcts.com 0 42L5P5kaipb3jENO4XpNUg  user  2019-06-12 17:16:51 UTC 2019-06-12 17:16:51 UTC


# UPDATE ADMIN TOKEN TODO
heroku run rails db:migrate
heroku run rails console

# check how many useres there are
User.count

# check if User has desired properties
User.fist

# check if all Users have nil value for owner token
User.where(owner_token: nil).count
User.where(owner_token: nil)

# update Users owner_token
User.where(owner_token: nil).each do |user|
  user.owner_token = loop do
    random_token = SecureRandom.urlsafe_base64(nil, false)
    break random_token unless User.exists?(owner_token: random_token)
  end
  user.save!
end

# check if all Users have NOT a nil value for owner token (should be 0)
User.where(owner_token: nil).count

# display all owner_tokens
User.all.each { |user| puts user.owner_token }

# PHASE 1 SUCCESFULL! ---------------------------------------------------------
# -> IF THIS WORKED try to signup with a new user and track if the owner token is created
# create user
User.last # worked?
# if yes, delete that user
User.last.delete

