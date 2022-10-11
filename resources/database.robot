*** Settings ***
Documentation        Database helpers connection

Library              RobotMongoDBLibrary.Delete
Library              RobotMongoDBLibrary.Find

*** Variables ***
&{MONGO_URI}       connection=mongodb+srv://buger:vVaUv3YBz54QXU0a@cluster0.6ikhayg.mongodb.net/PartnerDB?retryWrites=true&w=majority    database=PartnerDB  collection=partner
