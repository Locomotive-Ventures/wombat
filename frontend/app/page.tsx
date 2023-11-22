import AuthButton from '../components/AuthButton'
import { cookies } from 'next/headers'
import { createClient } from '@/utils/supabase/server'
import Header from '@/components/Header'
import Head from 'next/head';
import AddCampaignButton from '../components/AddCampaignButton'


export default async function Index() {
  const cookieStore = cookies()
  const supabase = createClient(cookieStore)


  const {
    data: { user },
  } = await supabase.auth.getUser()
//:)\?\?/?/:(>'-'

  return (
    <div className='w-full ' style={{background: '#FFFCF2',}}>
      <div className=' w-full flex'>
        <Head>
          <link rel="msapplication-config" href="/browserconfig.xml"></link>
        </Head>
        <Header/>
        <AuthButton/>
      </div>
      <div className='w-full flex'>
        <AddCampaignButton/>
      </div>
    </div>
      
  )
}
