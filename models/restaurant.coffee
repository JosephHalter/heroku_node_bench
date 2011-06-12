mongoose = require "mongoose"
Schema = mongoose.Schema
ObjectId = Schema.ObjectId

Restaurant = new Schema {
  name: String
  address: {
    street: String
    zip_code: String
    commune_id: ObjectId
    latitude: Number
    longitude: Number
  }
  created_at: Date
  updated_at: Date
}

Restaurant.pre "save", (next) ->
  if(this.isNew)
    this.created_at = new Date()
  this.updated_at = new Date()
  next()

Restaurant.methods["to_json"] = ->
  JSON.stringify {id: this._id, name: this.name}

# website" varchar(255) DEFAULT NULL,
# slogan_en" text DEFAULT NULL,
# overall_rating" int4 DEFAULT NULL,
# disabled" bool NOT NULL DEFAULT false,
# photo1_file_name" varchar(255) DEFAULT NULL,
# photo1_content_type" varchar(255) DEFAULT NULL,
# photo1_file_size" int4 DEFAULT NULL,
# photo1_updated_at" timestamp(6) NULL DEFAULT NULL,
# photo2_file_name" varchar(255) DEFAULT NULL,
# photo2_content_type" varchar(255) DEFAULT NULL,
# photo2_file_size" int4 DEFAULT NULL,
# photo2_updated_at" timestamp(6) NULL DEFAULT NULL,
# photo3_file_name" varchar(255) DEFAULT NULL,
# photo3_content_type" varchar(255) DEFAULT NULL,
# photo3_file_size" int4 DEFAULT NULL,
# photo3_updated_at" timestamp(6) NULL DEFAULT NULL,
# selected" bool NOT NULL DEFAULT false,
# homepage" bool NOT NULL DEFAULT false,
# scheduling_level" int4 NOT NULL DEFAULT 0,
# photo4_file_name" varchar(255) DEFAULT NULL,
# photo4_content_type" varchar(255) DEFAULT NULL,
# photo4_file_size" int4 DEFAULT NULL,
# photo4_updated_at" timestamp(6) NULL DEFAULT NULL,
# photo5_file_name" varchar(255) DEFAULT NULL,
# photo5_content_type" varchar(255) DEFAULT NULL,
# photo5_file_size" int4 DEFAULT NULL,
# photo5_updated_at" timestamp(6) NULL DEFAULT NULL,
# rank" int4 NOT NULL DEFAULT 0,
# client_id" varchar(255) DEFAULT NULL,
# phone" varchar(255) DEFAULT NULL,
# fax" varchar(255) DEFAULT NULL,
# opening_hours_en" text DEFAULT NULL,
# opening_hours_fr" text DEFAULT NULL,
# opening_hours_de" text DEFAULT NULL,
# slogan_fr" text DEFAULT NULL,
# slogan_de" text DEFAULT NULL,
# gsm" varchar(255) DEFAULT NULL,
# parent_id" int4 DEFAULT NULL,
# validated_at" timestamp(6) NULL DEFAULT NULL,
# bookings_count" int4 DEFAULT NULL,
# fulltext" text DEFAULT NULL,
# cc" varchar(255) DEFAULT NULL,
# notification_type" int4 NOT NULL DEFAULT 0,
# automatic_withdraw" bool NOT NULL DEFAULT false,
# fulltext_without_accent" text DEFAULT NULL,
# vote_count" int4 DEFAULT NULL,
# contract_monthly_fee" int4 NOT NULL DEFAULT 0,
# contract_monthly_meals" int4 NOT NULL DEFAULT 0,
# contract_per_meal_fee" int4 NOT NULL DEFAULT 0,
# teaser_fr" text DEFAULT NULL,
# teaser_en" text DEFAULT NULL,
# teaser_de" text DEFAULT NULL

mongoose.model "Restaurant", Restaurant