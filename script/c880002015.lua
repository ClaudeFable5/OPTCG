-- AUTO-GENERATED: P-011 / 우타
-- rules_id=P-011 script_id=880002015 fingerprint=bcc4bc4376b994221850fd470eb42ac09bbba1e0173fdf4897feeb2d43637cdc
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-011]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                vanilla=true,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】1(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다): 이번 턴 동안, 자신의 원래 효과가 없는 캐릭터 1장까지의 파워 +2000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[P-011]],
    schema_version=1,
  })
end
