'use strict';

// Start with an empty array for Git PR Reviewers
let gitPRReviewersArray = [];

// Who are you?
const self = 'Ori Alvarez';

// Back-End Developers
const backEnd = [
  'Stephen Levine'
];

// Development and Operations
const devOps = [
  'Jeffrey Beckett',
  'Connor Stec'
];

// Front-End Developers
const frontEnd = [
  'Frank Aiello',
  'Luis Alvarez',
  'Nick Ronnei',
  'Erin Sullivan'
];

// Project Managers
const projectManagers = [
  'Kyle Bean'
]

// Quality Assurance
const qa = [
  'Domenic D\'Onofrio',
  'Jack Herndel'
];

// Parse command line arguments, omitting the first two elements
const processArguments = process.argv.slice(2);

if(processArguments.length === 0) {
  // If no argument exists push backEnd, frontEnd, and qa arrays
  gitPRReviewersArray.push(...backEnd, ...frontEnd, ...qa);
} else {
  // Push arrays based on argument values
  processArguments.forEach(processArgument => {
    switch(processArgument) {
      case 'be':
      case 'backend':
        gitPRReviewersArray.push(...backEnd);
        break;
      case 'do':
      case 'devops':
        gitPRReviewersArray.push(...devOps);
        break;
      case 'fe':
      case 'frontend':
        gitPRReviewersArray.push(...frontEnd);
        break;
      case 'pm':
      case 'project manager':
        gitPRReviewersArray.push(...projectManagers);
        break;
      case 'qa':
      case 'quality assurance':
        gitPRReviewersArray.push(...qa);
        break;
      case 'all':
      default:
        gitPRReviewersArray.push(
          ...backEnd,
          ...devOps,
          ...frontEnd,
          ...projectManagers,
          ...qa
        );
    }
  });
}

// Filter out the unnecessary in the array
// - Duplicates
// - Self
const removeCruft = array => {
  let unique = {};
  array.forEach(i => {
    if(!unique[i] && i !== self) {
      unique[i] = true;
    }
  });
  return Object.keys(unique);
}

// 1. Remove cruft in the array
// 2. Randomize the array
// 3. Get the first two elements of the array
const gitPRReviewers = removeCruft(gitPRReviewersArray)
  .sort(() => 0.5 - Math.random())
  .slice(0,2);

// Line break for cleaner logging
console.log('');
// List the two chosen reviewers
gitPRReviewers.forEach((gitPRReviewer, index) => {
  console.log(`${index + 1}.`, gitPRReviewer);
});
// Line break for cleaner logging
console.log('');
