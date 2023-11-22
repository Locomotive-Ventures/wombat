import Link from 'next/link'

import { createClient } from '@/utils/supabase/server';
import { cookies } from 'next/headers';

export default async function AddCampaignButton() {
  const cookieStore = cookies();
  const supabase = createClient(cookieStore);

  const {
    data: { user },
  } = await supabase.auth.getUser();

  return (
    <div className="w-full flex">
      <div
        className="w-1/2"
        style={{
          padding: '1.5rem',
          color: 'black',
          background: '#FFFCF2',
          textAlign: 'left',
          fontSize: '2vh',
          fontWeight: 'bold',
          display: 'flex',
          alignItems: 'center',
        }}
      >
        Welcome {user?.email} !
      </div>
      <div className="w-1/2 flex items-end justify-end">
      <Link href="/addcampaign"
      style={{
        color: 'black',
        background: '#CCC5B9',
        fontSize: '2vh',
        fontWeight: 'bold',
        height: '15vh', 
        width: '15vw', 
        display: 'flex',
        alignItems: 'center', 
        justifyContent: 'center', 
        textDecoration: 'none', 
      }}
      >
            Add Campaign
        </Link>
      </div>
    </div>
  );
}
//