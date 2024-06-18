## Getting Started 🚀

This is a deep guide into how to setup your Calentre Admin flutter.

### 1. Clone the Repo

- Clone the repository: `git clone https://github.com/calentre/calentre.git`
- Move to the project: `cd calentre`
- Grab dependencies: `flutter pub get`

### 2. Setup Supabase Instance

What's Supabase? [read here](https://supabase.com/)

- Create or sign-in your Supabase account [here](https://supabase.com/dashboard)
- Create a Supabase project from your dashboard - [here](https://supabase.com/dashboard/projects)
  - You need to create a Supabase project that will act as your Calentre Dev environment. You can name this project anything you like and play around as much as you like. You can use this [guide](https://www.youtube.com/watch?v=-jISW-jVG-s&ab_channel=CodewithGuillaume) to get familiar with Supabase and creating a new project.
- Grab your `supabaseSecret` from your supabase project `settings/API/Project API keys`
- Add Providers for your Authentication
  - Add Google provider [(Guide to obtain your ClientID and Client Secret)](https://developers.google.com/identity/gsi/web/guides/get-google-api-clientid)

### 3. Run Project

- Go back to your project and run `flutter run` to start project and you should be ready to go

If you run into any troubles, reach out to us on [discord](https://discord.gg/Z4a8j6ckVb)
