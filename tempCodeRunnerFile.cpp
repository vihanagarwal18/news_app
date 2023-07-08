#include <iostream>
#include <cstdlib>
#include <ctime>


using namespace std;

const int FRAME_COUNT = 6;
const int TIMEOUT = 3;

// Simulate sending a frame
bool sendFrame(int frameNumber)
{
    // Simulate transmission delay
    srand(static_cast<unsigned int>(time(0)));
    int randomDelay = rand() % 4;

    // Simulate successful transmission (no error)
    if (randomDelay != 0)
    {
        cout << "Frame " << frameNumber << " transmitted successfully." << endl;
        return true;
    }

    cout << "Error occurred while transmitting frame " << frameNumber << ". Retransmitting..." << endl;
    return false;
}

// Simulate receiving an acknowledgement
bool receiveAcknowledgement()
{
    // Simulate acknowledgement delay
    srand(static_cast<unsigned int>(time(0)));
    int randomDelay = rand() % 4;

    // Simulate successful acknowledgement (no error)
    if (randomDelay != 0)
    {
        cout << "Acknowledgement received." << endl;
        return true;
    }

    cout << "Error occurred while receiving acknowledgement. Retransmitting..." << endl;
    return false;
}

int main()
{
    int frameNumber = 1;
    bool transmissionCompleted = false;

    while (frameNumber <= FRAME_COUNT)
    {
        // Send the current frame
        bool frameTransmitted = sendFrame(frameNumber);

        bool acknowledgementReceived = false; // Declaration moved outside if statement

        if (frameTransmitted)
        {
            // Wait for acknowledgement
            acknowledgementReceived = receiveAcknowledgement();

            if (acknowledgementReceived)
            {
                // Move to the next frame
                frameNumber++;
            }
        }

        // Simulate timeout
        if (!frameTransmitted || !acknowledgementReceived)
        {
            cout << "Timeout occurred. Retransmitting frame " << frameNumber << "..." << endl;
        }

        // Add delay between frames
        srand(static_cast<unsigned int>(time(0)));
        int delay = rand() % 3 + 1;
        cout << "Delaying " << delay << " seconds before sending the next frame." << endl;
        sleep(delay);
    }

    cout << "Transmission completed successfully." << endl;
    return 0;
}
