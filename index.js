const express = require('express');
const app = express();
const port = 3000;
const { v4: uuidv4 } = require('uuid'); // Make sure to install uuid package

app.listen(port, () => {
    console.log(`Mock API server is running at http://localhost:${port}`);
});

// Helper function to format date as "YYYY-MM-DD" or "Tomorrow"
function formatDate(date) {
    const tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);
    
    if (date.toISOString().split('T')[0] === tomorrow.toISOString().split('T')[0]) {
        return 'Tomorrow';
    }
    return date.toISOString().split('T')[0];
}

// Helper function to get random shift time range
function getRandomShiftRange() {
    const ranges = ['00-08', '08-16', '16-24'];
    return ranges[Math.floor(Math.random() * ranges.length)];
}

// Endpoint: Returns available shifts for the next 9 days
app.get('/api/v1/shifts/mine', (req, res) => {
    const shifts = [];
    const today = new Date();

    for (let i = 1; i <= 9; i++) {
        const shiftDate = new Date(today);
        shiftDate.setDate(today.getDate() + i);

        shifts.push({
            choice: `${formatDate(shiftDate)} (${getRandomShiftRange()})`,
            value: uuidv4()
        });
    }

    res.json({
        items: shifts
    });
});
