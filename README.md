# Tokenized Food and Beverage Nutrition Optimization

This project implements a blockchain-based system for optimizing nutrition through tokenized food and beverage tracking. Built with Clarity smart contracts for the Stacks blockchain, it provides a transparent and secure way to manage nutritional data and recommendations.

## Overview

The system consists of five main smart contracts:

1. **Nutritionist Verification Contract**: Validates nutrition professionals' credentials
2. **Dietary Assessment Contract**: Assesses individual dietary needs
3. **Meal Planning Contract**: Plans optimized nutrition meals
4. **Health Tracking Contract**: Tracks nutrition health outcomes
5. **Product Recommendation Contract**: Recommends nutrition products

## Smart Contracts

### Nutritionist Verification Contract

This contract maintains a registry of verified nutrition professionals. Features include:

- Registration of nutritionists with credentials and specializations
- Verification process by admin
- Public verification status checking

### Dietary Assessment Contract

This contract stores and manages users' dietary profiles. Features include:

- Creation and updating of dietary profiles
- Assessment by verified nutritionists
- BMR (Basal Metabolic Rate) calculation

### Meal Planning Contract

This contract enables the creation and management of personalized meal plans. Features include:

- Creation of meal plans by verified nutritionists
- Storage of nutritional information (calories, macros)
- Verification of meal plan suitability based on user needs

### Health Tracking Contract

This contract allows users to track their health metrics over time. Features include:

- Logging of weight, body composition, and subjective health metrics
- Retrieval of historical health data
- Calculation of health trends

### Product Recommendation Contract

This contract manages a database of nutrition products and provides recommendations. Features include:

- Registration of nutrition products with detailed information
- Verification of products by nutritionists
- Personalized product recommendations based on dietary profiles

## Getting Started

### Prerequisites

- [Clarinet](https://github.com/hirosystems/clarinet) - Clarity development environment
- Basic knowledge of Clarity language and Stacks blockchain

### Installation

1. Clone this repository
2. Navigate to the project directory
3. Use Clarinet to deploy and test the contracts

\`\`\`bash
# Initialize a new Clarinet project
clarinet new my-nutrition-project

# Copy the contract files to the contracts directory
cp contracts/* my-nutrition-project/contracts/

# Run tests
cd my-nutrition-project
clarinet test
\`\`\`

## Usage Examples

### Registering as a Nutritionist

```clarity
(contract-call? .nutritionist-verification register-nutritionist "Dr. Jane Smith" "PhD in Nutrition Science, Certified Dietitian" "Sports Nutrition")
