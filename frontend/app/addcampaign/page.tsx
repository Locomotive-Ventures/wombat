import { cookies } from 'next/headers'
import { createClient } from '@/utils/supabase/server'
import Header from '@/components/Header'
import Head from 'next/head';
import AuthButton from '@/components/AuthButton';
import { tree } from 'next/dist/build/templates/app-page';
import * as CryptoJS from 'crypto-js';


export default async function Index() {
  const cookieStore = cookies()
  const supabase = createClient(cookieStore)


  const {
    data: { user },
  } = await supabase.auth.getUser()

  const dataScrambler = async (formData: FormData) => 
  {
    "use server"
    console.log("data scrambled");
    return (formData);
  }

  const inputValidation = async (formData: FormData) => 
  {
    "use server"
    console.log(formData);
    return true;
  }

  const uniqueIDGenerator = async (formData: FormData) =>
  {
    "use server"
    // Concatenate the campaign details
    const campaignName = formData.get('campaignName') as string;
    const campaignType = formData.get('campaignType') as string;
    const campaignLocation= formData.get('location') as string;
    const concatenatedStr: string = `${campaignName}_${campaignType}_${campaignLocation}`;

    // Use crypto to create a unique hash (using SHA-256 for stronger security)
    const campaignId: string = CryptoJS.SHA256(concatenatedStr).toString();
    console.log("Unique ID:")
    console.log(campaignId);
    return campaignId;
}

  const handleSubmit = async (formData: FormData) => {
    "use server"

   /* const phoneNumberList = formData.get('numlist') as string;
    const isPhoneNumberListValid = /^\d+$/.test(phoneNumberList);
    console.log(isPhoneNumberListValid)
    if (isPhoneNumberListValid==false)
    {
      formData.set('numlist', 'Invalid Entry: Please Enter Only Numbers');
    }
    else
    {
      console.log(phoneNumberList);
    }
    //cName = form.campaignName*/

    //Input validation
    if (await inputValidation(formData))
    {
      console.log("Data is valid proceeding to next pjhase");
      console.log(dataScrambler(formData));
      uniqueIDGenerator(formData);
    }
    else{
      console.log("Data is invalid cannot proceed to send");
    }
    //Unique id generation
    //pass to database
  };
  return (
    <div className='w-full ' style={{background: '#FFFCF2',}}>
      <div className=' w-full flex'>
        <Head>
          <link rel="msapplication-config" href="/browserconfig.xml"></link>
        </Head>
        <Header/>
        <AuthButton/>
      </div>
      <div>
        <h1
        style={{padding: '1.5rem',
        color: 'black',
        background: '#FFFCF2',
        textAlign: 'left',
        fontSize: '3vh',
        fontWeight: 'bold',
        display: 'flex',
        alignItems: 'center',}}
        >Add Campaign</h1>
      </div>
      <div
      style={{color: 'black',
      background: '#FFFCF2',
    }}
      >
        <form>
            <div className="w-full flex" 
            style={{padding: '1.5rem',
            color: 'black',
            background: '#FFFCF2',
            textAlign: 'left',
            fontSize: '2vh',
            fontWeight: 'bold',
            display: 'flex',
            alignItems: 'center',}}
            >
                <div className="w-1/2 flex ">
                    <fieldset name="Campaign Information"
                    style={{border: '1px solid #ccc',
                    padding: '10px',}}
                    >
                        <legend>Campaign Information</legend>
                        <label >Campaign Name: </label>
                        <input type="text" id="campaignName" name="campaignName" required></input><br></br>
                        <label >Campaign Type: </label>
                        <select id="campaignType" name="campaignType">
                            <option value="FireEvacuation">Fire Evacuation</option>
                            <option value="FireWarning">Fire Warning</option>
                        </select><br></br>
                        <label >Location: </label>
                        <input type="text" id="location" name="location" required></input>
                    </fieldset>
                </div>
                <div className="w-1/2 flex ">
                    <fieldset name="Caller Information"
                    style={{border: '1px solid #ccc',
                    padding: '10px',}}
                    >
                        <legend>Caller Information</legend>
                        <label >Paste All Phone Numbers Below: </label><br></br>
                        <textarea
                          id="numlist"
                          name="numlist"
                          rows={4}
                          style={{
                            width: '40vw',
                            height: '20vw',
                            padding: '0.5rem',
                            border: '2px solid #cbd5e0',
                            borderRadius: '0.375rem',
                            overflow: 'auto',
                            outline: 'none',
                            transition: 'border-color 0.15s ease-in-out',
                          }}
                          className="focus:border-blue-500"
                          placeholder={"0413123232,\n0447736526,\n0414478283"}
                          />
                    </fieldset>
                </div>
            </div>
            <div className="w-full flex" style={{
              padding: '1.5rem',
              color: 'black',
              background: '#FFFCF2',
              textAlign: 'left',
              fontSize: '2vh',
              fontWeight: 'bold',
              display: 'flex',
            }}>
              <div
                className="w-1/2 flex "
              ></div>
              <div
                className="w-1/2 flex"
              >
                <label htmlFor="agree" className="block text-right pr-4">
                  <input type="checkbox" id="agree" name="agree" required className="mr-2" />
                  I confirm these people will be called, and I have authorization to make these calls.
                </label>
              </div>
            </div>
            <div className="w-full flex" style={{
              padding: '1.5rem',
              color: 'black',
              background: '#FFFCF2',
              textAlign: 'left',
              fontSize: '2vh',
              fontWeight: 'bold',
              display: 'flex',
            }}>
              <div className='w-1/2 flex'></div>
              <div
              className='w-1/2 flex'
              >
                <button type="button" className="bg-gray-300 hover:bg-gray-400 px-4 py-2 rounded">Cancel</button>
                <button type="submit" formAction={handleSubmit} className="bg-gray-300 hover:bg-blue-600 text-black px-4 py-2 rounded">Submit</button>
              </div>
            </div>
        </form>
      </div>
    </div>
  )
}
