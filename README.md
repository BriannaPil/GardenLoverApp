# GardenLover – Original App Design Project

## Table of Contents
- Overview  
- Product Spec  
- Wireframes  
- Schema  

---

# Overview

## Description
GardenLover is a mobile gardening assistant that helps users determine whether a plant can grow in their region based on USDA Hardiness Zones. It also provides seasonal planting guidance, smart watering reminders using weather data, and a personal "My Garden" tracker for monitoring plant growth and care.

## App Evaluation

- **Category:** Education / Productivity  
- **Mobile:** Mobile-first; uses GPS, notifications, and optional camera features.  
- **Story:** Helps users confidently select plants that fit their climate, understand the best growing seasons, and maintain proper care routines.  
- **Market:** Beginner and intermediate gardeners, plant lovers, homeowners, students, and hobby growers.  
- **Habit:** Semi-daily use for watering reminders and weekly for plant care tracking.  
- **Scope:** Narrow but deep — focuses on suitability checks, plant information, care reminders, and plant tracking.

---

# Product Spec

## 1. User Stories (Required and Optional)

### Required Must-have Stories
- User can enter ZIP code or use GPS to get their USDA Hardiness Zone.  
- User can search for a plant and view whether it grows in their region.  
- User can view best planting seasons and growing timeline.  
- User can get basic weather-based watering suggestions.  
- User can add plants to a "My Garden" list.  
- User can update last-watered information and notes for each plant.  
- App displays a splash/loading screen with nature-themed animation.

### Optional Nice-to-have Stories
- User can receive push notifications for watering reminders.  
- User can upload or take plant photos.  
- User can track plant growth history.  
- User can use AI plant recognition.  
- User can share plant progress to social media.  
- App includes dark mode.

---

## 2. Screen Archetypes

### Splash Screen
- Animated splash view that transitions into the Home screen.

### Home Screen
- User can enter ZIP code or use GPS.  
- Displays USDA zone and navigation to features.

### Plant Suitability Screen
- User can search for a plant.  
- Displays temperature range, hardiness info, and suitability result.

### Seasonal Guide Screen
- Displays planting month, growing season, and harvest timeline.

### Watering Screen
- Shows watering suggestions based on weather.  
- Tracks user's "last watered" dates.

### My Garden Screen
- User can view all saved plants.  
- Each plant can open a detail screen.

### Plant Detail Screen
- Shows sunlight needs, soil type, temperature tolerance, watering frequency, and notes.

---

## 3. Navigation

### Tab Navigation (Tab to Screen)
- Home  
- My Garden  
- Seasonal Guide  
- Watering  

### Flow Navigation (Screen to Screen)
- Splash Screen → Home  
- Home → Plant Suitability  
- Home → Seasonal Guide  
- Home → Watering  
- My Garden → Plant Detail → Edit Plant  

---

# Wireframes
(Add photos of hand-drawn wireframes here)

---

# BONUS: Digital Wireframes & Mockups
(Optional section for digital sketches)

---

# BONUS: Interactive Prototype
(Optional prototype video or GIF)

---

# Schema

## Models

### Plant
| Property | Type | Description |
|----------|------|-------------|
| id | String | Unique plant identifier |
| name | String | Plant name |
| imageURL | String | Plant image URL (optional) |
| description | String | Basic plant information |
| suitableZones | Array[String] | USDA zones where plant can grow |
| sunlight | String | Sunlight requirement |
| watering | String | Watering frequency |

### UserPlant (My Garden)
| Property | Type | Description |
|----------|------|-------------|
| id | String | Unique entry identifier |
| name | String | Plant name |
| dateAdded | Date | When user added plant |
| lastWatered | Date | Last watered date |
| notes | String | User notes |
| image | Binary/String | Optional plant photo |

### Weather
| Property | Type | Description |
|----------|------|-------------|
| temp | Double | Current temperature |
| humidity | Int | Current humidity |
| rainfall | Double | Rain forecast used for watering logic |

---

## Networking

### List of Network Requests by Screen

**Home Screen**
- **[GET]** /usda-zone?zip=  
  - Retrieves USDA Hardiness Zone for user ZIP.

**Plant Suitability Screen**
- **[GET]** /crops?filter=<plant name>  
  - Retrieves plant information from OpenFarm.

**Watering Screen**
- **[GET]** /weather?zip=  
  - Fetches weather data for watering logic.

### Example API Endpoints

**USDA Hardiness Zone API**
```
GET https://phzmapi.org/<zipcode>.json
```

**OpenFarm API**
```
GET https://openfarm.cc/api/v1/crops?filter=<plant name>
```

**OpenWeatherMap**
```
GET https://api.openweathermap.org/data/2.5/weather?zip=<zip>&appid=<apiKey>
```
