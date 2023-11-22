import { cookies } from 'next/headers'
import { createClient } from '@/utils/supabase/server'
import Header from '@/components/Header'
import Head from 'next/head';
import AuthButton from '@/components/AuthButton';


export default async function Index() {
  const cookieStore = cookies()
  const supabase = createClient(cookieStore)


  const {
    data: { user },
  } = await supabase.auth.getUser()

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
                    style={{border: '1px solid #ccc', /* Add a border to the fieldset */
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
                    <fieldset name="Caller Information">
                        <legend>Caller Information</legend>
                        <label >Paste All Phone Numbers Below: </label><br></br>
                        <textarea></textarea>
                    </fieldset>
                </div>
            </div>
        </form>
      </div>
    </div>
      
  )
}
