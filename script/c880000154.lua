-- AUTO-GENERATED: OP01-031 / 코즈키 오뎅
-- rules_id=OP01-031 script_id=880000154 fingerprint=48d823b6b55a8f323e0d0e841519c20ef851708fc39d6b90f042f5597ebdf310
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-031]],
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
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              trait=[[와노쿠니]],
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 패에서 《와노쿠니》 특징을 가진 카드를 1장 버릴 수 있다: 자신의 두웅!!을 2장까지 액티브로 한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-031]],
    schema_version=1,
  })
end
