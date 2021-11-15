# Flutter App Template

Created by @denya

Contains:

* Fastlane distribution

* github workflow example

## App

Use 2 flavors: `dev`, `prod`

## Fastlane

* Copy `.env.<flavor>.example` -> `.env.<flavor>`

### Available lines

#### `fastlane --env <flavor> firebase_beta`

Builds both android & ios, uploads to Firebase App Distirbution.

#### `fastlane --env <flavor> ios firebase_beta_ios`

Builds ios & upload to Firebase App Distirbution.

#### `fastlane --env <flavor> android firebase_beta_android`

Builds ios & upload to Firebase App Distirbution.

## Github Actions

TODO: Add documentation about SECRETS

TODO: Improve versioun build numeration (use timestamp YYYYMMDDHHMM.seq)

### nstallation guide

* #ios Get firebase service account for deployment `firebase_credentials.<flavor>.json` and put it into the repo root.

* #android `play-store.key.json` ← Google Play Service Account for distribution

* #android `upload-keystore.jks` ← Keystore to build & sign android app

## Authors

* Denis Moskalets (@denya)
