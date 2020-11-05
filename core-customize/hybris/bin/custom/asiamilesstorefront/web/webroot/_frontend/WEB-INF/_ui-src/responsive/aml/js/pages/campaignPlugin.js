import campaignSportsProducts from '../modules/campaign/campaignSportsProducts';
import campaignCardOne from '../modules/campaign/campaignCardOne';
import campaignCardTwo from '../modules/campaign/campaignCardTwo';
import campaignCardThree from '../modules/campaign/campaignCardThree';
import homeProductCard from '../modules/homePage/homeProductCard';
import summerGadgetsLast from '../modules/campaign/summerGadgetsLast';

$(function () {
  campaignSportsProducts();
  campaignCardThree('.J-campaign_products');
  campaignCardOne('.J-hero-banner');
  campaignCardTwo('.J-campaign_exercise');
  campaignCardThree('.J-campaign_card');
  homeProductCard('.J-homeProductCard');
  summerGadgetsLast()
})