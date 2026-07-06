-- AUTO-GENERATED: OP11-044 / 빈스모크 저지
-- rules_id=OP11-044 script_id=880001378 fingerprint=a70517757ccc47bb20e19576f449ede49cd91cafa52132c6b5b5e21186bfefbb
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-044]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=0,
              filter={
                trait=[[제르마 66]],
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
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 패 1장을 버릴 수 있다: 이번 턴 동안, 자신의 《제르마 66》 특징을 가진 모든 캐릭터의 파워 +1000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-044]],
    schema_version=1,
  })
end
