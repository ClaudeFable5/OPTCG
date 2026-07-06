-- AUTO-GENERATED: OP01-003 / 몽키 D. 루피
-- rules_id=OP01-003 script_id=880000126 fingerprint=8eac75afe61c2b38cb35a8f8a8f62242d62ff22a65d95d4ad398f0238cb2f81a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                cost_lte=5,
                trait_any={
                  [[초신성]],
                  [[밀짚모자 일당]],
                },
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            amount=1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LAST_TARGET]],
              mode=[[UP_TO]],
              owner=[[CONTEXT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=4,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】4(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다): 자신의 코스트 5 이하인 《초신성》 또는 《밀짚모자 일당》 특징을 가진 캐릭터를 1장까지 액티브로 하고 이번 턴 동안, 그 캐릭터의 파워 +1000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-003]],
    schema_version=1,
  })
end
