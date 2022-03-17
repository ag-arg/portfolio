with source as (

  select * from  {{ source('actblue', 'donations') }}

),

renamed as (

  select

    lineitemid as donation_id,

    --c3 name changed. this ensures one standard name throughout the data
    case when entityid = 53739 then 'Sunrise C4'
   		when entityid = 94513 then 'Sunrise Movement Education Fund'
   		when entityid = 67432 then 'Sunrise PAC - Unlimited'
   		when entityid = 65563 then 'Sunrise PAC - Coordinated'
   		else null end as committee_name,

    entityid as committee_id,

    amount,

    contributionform as contribution_form,

    refcode as ref_code,

    case when ref_code like '%email%' then 'email'
         when ref_code like '%web%' then 'website'
  		 when ref_code like '%sms%' or ref_code like '%text%' then 'text'
  		 when ref_code is null then 'no ref code'
  		 when ref_code like '%ad%' then 'ad'
  		 when ref_code like '%facebook%' or ref_code like '%fb%' then 'facebook'
  		 when ref_code like '%insta%' then 'instagram'
  		 when ref_code like '%twitter%' then 'twitter'
  		 when ref_code like '%mobilize%' then 'mobilize'
  		 when ref_code like '%hub%' then 'hub'
  		 else 'other' end as channel,

    isrecurring as is_recurring,

    recurringduration as recurring_duration,

    recurringperiod as recurring_period,

    status,

    -- Donor personal info

    firstname as first_name,

    lastname as last_name,

    email,

    phone,

    addr1 as address,

    city,

    state,

    zip,

    country,

    occupation,

    employer,

    --Other info

    fecid as fed_id,

    withexpresslane as with_expresslane,

    expresssignup as express_signup,

    iseligibleforexpresslane as is_express_lane_eligible,

    isexpress as is_express,

    ismobile as is_mobile,

    ispaypal as is_paypal,

    ordernumber as order_number,

    sequence,

    uniqueidentifier as unique_identifier,

    customfields as custom_fields,

    giftdeclined as gift_declined,

    giftidentifier as gift_identifier,

    abtestname as ab_test_name,

    abtestvariation as ab_test_variation,

    textmessageoption as text_message_option,

    -- Dates

    {{ standardize_timezone('paidat') }} as paid_at,

    {{ standardize_timezone('createdat') }} as created_at

  from source

)

select * from renamed
