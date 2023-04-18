'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
    return queryInterface.bulkInsert('user1s', [{
      firstName_user1: 'John',
      lastName_user1 : 'Doe',
      email_user_1: 'example@example.com',
      createdAt: new Date(),
      updatedAt: new Date()
    }]);
 
  },

  async down (queryInterface, Sequelize) {
    return queryInterface.bulkDelete('Users', null, {});
  }
};
