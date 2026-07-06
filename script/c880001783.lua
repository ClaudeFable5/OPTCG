-- AUTO-GENERATED: ST05-001 / 샹크스
-- rules_id=ST05-001 script_id=880001783 fingerprint=8800c6b54f445c99ce933bfa63dfe66c7bb656271157c63f9f128f978e7cdfc7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST05-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=0,
              filter={
                trait=[[FILM]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=3,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】두웅!!-3(자신 필드의 두웅!!을 지정된 수 만큼 두웅!! 덱으로 되돌릴 수 있다): 이번 턴 동안, 자신의 《FILM》 특징을 가진 모든 캐릭터의 파워 +2000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST05-001]],
    schema_version=1,
  })
end
