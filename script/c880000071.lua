-- AUTO-GENERATED: EB02-010 / 몽키 D. 루피
-- rules_id=EB02-010 script_id=880000071 fingerprint=0a65fda9a510da76ff9790979110f0d754fcc49e23cb2d3821723be06c520af3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-010]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
          {
            amount=1000,
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            ["then"]=true,
          },
        },
        conditions={
          {
            filter={
              trait=[[밀짚모자 일당]],
            },
            op=[[ONLY_CHARACTERS_MATCH]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=2,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】두웅!!-2: 자신 필드의 캐릭터가 《밀짚모자 일당》 특징을 가진 캐릭터뿐이라면, 자신의 두웅!!을 2장까지 액티브로 한다. 그 후, 다음 상대의 턴 종료 시까지, 이 리더의 파워 +1000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB02-010]],
    schema_version=1,
  })
end
