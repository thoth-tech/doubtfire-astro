import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

// https://astro.build/config
export default defineConfig({
  integrations: [
    starlight({
      title: 'OnTrack',
      social: {
        github: 'https://github.com/thoth-tech',
      },
      sidebar: [
        {
          label: 'Document',
          items: [
            // Each item here is one entry in the navigation menu.
            {
              label: 'Introduction',
              link: '/document/introduction/',
            },
          ],
        },
        {
          label: 'Intial Setup',
          autogenerate: {
            directory: '/setup',
          },
          items: [
            {
              label: 'OnTrack Intial Setup Guidance',
              link: '/setup/set',
            },
          ],
        },

        {
          label: 'Frontend documentation',
          autogenerate: {
            directory: '/frontend',
          },
          items: [
            {
              label: 'Frontend Documentation',
              link: '/frontend/page',
            },
          ],
        },

        {
          label: 'Backend documentation',
          autogenerate: {
            directory: '/backend',
          },
          items: [
            {
              label: 'Doubtfire API Documentation',
              link: '/backend/api/api_list',
            },
            {
              label: 'Activity Types',
              link: '/backend/api/activity_types',
            },
            {
              label: 'Error codes',
              link: '/backend/api/error_codes',
            },
          ],
        },
        {
          label: 'Team',
          autogenerate: { directory: 'team' },
        },
      ],
    }),
  ],
});
