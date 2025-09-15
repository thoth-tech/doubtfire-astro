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
              label: 'Frontend Documentation',
              link: '/frontend/page',
            },
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
              label: 'Frontend Tutor-Times Design',
              link: '/frontend/tutor-times/tutor-times-design',
            },
            {
              label:'Frontend Tutor-Times Requirements',
              link: '/frontend/tutor-times/tutor-times-requirements',
            }
           

          ],
        },

        {
          label: 'Backend documentation',
          autogenerate: {
            directory: '/backend',
          },
          items: [
            {
              label: 'Doubtfire API Documentation List',
              link: '/backend/api/api_list',
            },
            {
              label: 'activity types',
              link: '/backend/api/activity_types',
            },
            {
              label: 'admin',
              link: '/backend/api/admin',
            },
            {
              label: 'auth',
              link: '/backend/api/auth',
            },
            {
              label: 'campuses',
              link: '/backend/api/campuses',
            },
            {
              label: 'csv',
              link: '/backend/api/csv',
            },
            {
              label: 'projects API operation list',
              link: '/backend/api/projects',
            },
            {
              label: 'projects (1)',
              link: '/backend/api/projects_1',
            },
            {
              label: 'projects (2)',
              link: '/backend/api/projects_2',
            },
            {
              label: 'setting',
              link: '/backend/api/setting',
            },
            {
              label: 'students',
              link: '/backend/api/students',
            },
            {
              label: 'submission',
              link: '/backend/api/submission',
            },
            {
              label: 'tasks',
              link: '/backend/api/tasks',
            },
            {
              label: 'teaching periods',
              link: '/backend/api/teaching_periods',
            },
            {
              label: 'tii_actions',
              link: '/backend/api/tii_actions',
            },
            {
              label: 'tii_eula',
              link: '/backend/api/tii_eula',
            },
            {
              label: 'tii_hook',
              link: '/backend/api/tii_hook',
            },
            {
              label: 'tutorials',
              link: '/backend/api/tutorials',
            },
            {
              label: 'unit_roles',
              link: '/backend/api/unit_roles',
            },
            {
              label: 'units API operation list',
              link: '/backend/api/units',
            },
            {
              label: 'units id',
              link: '/backend/api/units_id',
            },
            {
              label: 'users',
              link: '/backend/api/users',
            },
            {
              label: 'webcal',
              link: '/backend/api/webcal',
            },
            {
              label: 'Error codes',
              link: '/backend/api/error_codes',
            },
            {
              label: 'Unit Tutorial Streams',
              link: '/backend/api/unit-tutorial_streams',
            },
            {
              label: 'Unit Group Sets',
              link: '/backend/api/unit-group_sets',
            },
            {
              label: 'Units Task Definition',
              link: '/backend/api/api-task_definitions',
            },
            {
                label: 'observer-access',
                link: '/backend/api/observer-access',
              },
            {
              label: 'learning',
              link: '/backend/api/learning',
            },
            {
              label: 'stats',
              link: '/backend/api/stats',
            },
            {
              label: 'Tutor Times',
              autogenerate: {
                directory: '/tutor_times',
              },
              items: [
                {
                  label: 'Requirements Document',
                  link: '/backend/tutor_times/requirements_document',
                },
                {
                  label: 'Design Document',
                  link: '/backend/tutor_times/design_document',
                },
              ],
            },
          ],
        },
        {
          label: 'Team',
          autogenerate: { directory: 'team' },
        },
        {
          label: 'Courseflow documentation',
          autogenerate: {
            directory: '/courseflow',
          },
          items: [
            {
              label: 'Courseflow Introduction',
              link: '/courseflow/requirements',
            },
            {
              label: 'Use Cases',
              link: '/courseflow/usecase',
            },
            {
              label: 'What is currently done?',
              link: '/courseflow/current_stage',
            },
            {
              label: 'Planned Features',
              link: '/courseflow/future',
            },
            {
              label: 'Visualisation',
              link: '/courseflow/diagrams',
            },
            {
              label: 'Frontend Structure',
              link: '/courseflow/frontend',
            },
            {
              label: 'Backend APIs',
              link: '/courseflow/backend',
            },
          ],
        },
        {
          label: 'Security',
          autogenerate: {
            directory: '/security',
          },
        },
      ],
    }),
  ],
});
