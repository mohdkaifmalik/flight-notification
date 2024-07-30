# Case Study Briefing

In this project, I developed a web application designed to provide flight status updates and notifications to passengers. The goal was to create a system capable of displaying real-time flight information, including delays, cancellations, and gate changes.

# Development Process

- **Design and Frontend:**
  - I used Figma to design the user interface, ensuring a clean and user-friendly experience.
  - Converted the design into HTML and CSS using Locofy, resulting in a responsive and visually appealing frontend.
  - The development was conducted within the Replit environment, allowing for easy management and sharing of code.

- **Database Setup:**
  - Developed an SQLite database (`flights.sql`) to store flight information, including flight number, airline, departure time, arrival time, and status.
  - The database is designed to store notification data and updates for any flight status changes, allowing for potential future enhancements to notify passengers of delays or cancellations.

# Current State

- **Frontend:** 
  - The HTML and CSS display static flight information extracted from the design process. This includes flight details such as departure and arrival times and statuses like on-time or delayed.

- **Database:**
  - While the database is not currently connected to the frontend, it is capable of tracking flight status updates and storing notification data, which can be used to alert passengers to changes.

# Challenges and Future Work

- **Backend Development:**
  - Due to limited experience, I was unable to complete the backend required to connect the frontend and database.
  - Future development will focus on building a backend using Python (Flask) to enable real-time updates and integrate notifications via email or SMS.

# Conclusion

This project demonstrates the ability to create a well-designed frontend and a structured database. While the current implementation lacks a fully functional backend, it lays the groundwork for future enhancements to achieve real-time flight updates and notifications.
  
  
# Setup Instructions

Note: Please ensure you have installed <code><a href="https://nodejs.org/en/download/">nodejs</a></code>

  To preview and run the project on your device:
  1) Open project folder in <a href="https://code.visualstudio.com/download">Visual Studio Code</a>
  2) In the terminal, run `npm install`
  3) Run `npm start` to view project in browser.
