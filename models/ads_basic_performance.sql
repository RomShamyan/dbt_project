{{
    config(
        materialized='table'
    )
}}

select  CAST(ad_id AS string) as ad_id,
            NULL as add_to_cart,
            CAST(adset_id as string) as adset_id,
            CAST(campaign_id as string) as campaign_id,
            channel,
            clicks,
            NULL as comments,
            NULL as creative_id,
            date,
            NULL as engagements,
            imps as impressions,
            NULL as installs,
            NULL as likes,
            NULL as link_clicks,
            NULL as placement_id,
            NULL as post_click_conversions,
            NULL as post_view_conversions,
            NULL as posts,
            NULL as purchase,
            NULL as registrations,
            revenue,
            NULL as shares,
            spend,
            conv as total_conversions,
            NULL as video_views
    from {{ ref('src_ads_bing_all_data')}}
UNION ALL 
    select  CAST(ad_id AS string) as ad_id,
            add_to_cart,
            CAST(adset_id as string) as adset_id,
            CAST(campaign_id as string) as campaign_id,
            channel,
            clicks,
            comments,
            CAST(creative_id as string) as creative_id,
            date,
            (views + clicks) as engagements,
            impressions,
            mobile_app_install as installs,
            likes,
            inline_link_clicks as link_clicks,
            NULL as placement_id,
            NULL as post_click_conversions,
            NULL as post_view_conversions,
            NULL as posts,
            purchase,
            complete_registration as registrations,
            purchase_value as revenue,
            shares,
            spend,
            purchase as total_conversions,
            NULL as video_views
    from {{ ref('src_ads_creative_facebook_all_data')}}
UNION ALL 
    select  CAST(ad_id AS string) as ad_id,
            add_to_cart,
            CAST(adgroup_id as string) as adset_id,
            CAST(campaign_id as string) as campaign_id,
            channel,
            clicks,
            NULL as comments,
            NULL as creative_id,
            date,
            NULL as engagements,
            impressions,
            rt_installs as installs,
            NULL as likes,
            NULL as link_clicks,
            NULL as placement_id,
            NULL as post_click_conversions,
            NULL as post_view_conversions,
            NULL as posts,
            purchase,
            registrations,
            NULL as revenue,
            NULL as shares,
            spend,
            conversions as total_conversions,
            video_views
    from {{ ref('src_ads_tiktok_ads_all_data')}}
UNION ALL

        select NULL as ad_id,
            NULL as add_to_cart,
            NULL as adset_id,
            CAST(campaign_id as string) as campaign_id,
            channel,
            clicks,
            comments,
            NULL as creative_id,
            date,
            engagements,
            impressions,
            NULL as installs,
            likes,
            url_clicks as link_clicks,
            NULL as placement_id,
            NULL as post_click_conversions,
            NULL as post_view_conversions,
            NULL as posts,
            NULL as purchase,
            NULL as registrations,
            NULL as revenue,
            NULL as shares,
            spend,
            NULL as total_conversions,
            video_total_views as video_views
    from {{ ref('src_promoted_tweets_twitter_all_data')}}